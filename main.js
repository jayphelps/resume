if (typeof WebAssembly === 'undefined') {
  throw new Error('Sorry, your browser doesn\'t support WebAssembly.');
}

function stringForIndex(heap, strIndex) {
  let str = '';
  // null terminated C-style strings for simplicity
  for (let i = strIndex; heap[i] !== 0; i++) {
    str += String.fromCharCode(heap[i]);
  }

  return str;
}

const memory = new WebAssembly.Memory({ initial: 1 });
const heap = new Uint8Array(memory.buffer);
let jsShadowHeapCounter = 0;
const jsShadowHeap = new Map();

function addToShadowHeap(value) {
  const shadowIndex = jsShadowHeapCounter++;
  jsShadowHeap.set(shadowIndex, value);
  return shadowIndex;
}

function jsValueToWasmValue(value) {
  if (typeof value === 'number') {
    return value;
  } else {
    return addToShadowHeap(value);
  }
}

const imports = {
  env: {
    'memory': memory,
    'document.body': addToShadowHeap(document.body),
    'log': strIndex => {
      console.log(stringForIndex(heap, strIndex));
    },
    'document.createElement': strIndex => {
      const tagName = stringForIndex(heap, strIndex);
      const el = document.createElement(tagName);
      return addToShadowHeap(el);
    },
    'Object::get': (objIndex, keyIndex) => {
      const obj = jsShadowHeap.get(objIndex);
      const key = stringForIndex(heap, keyIndex);
      return jsValueToWasmValue(obj[key]);
    },
    'Object::set': (objIndex, keyIndex, valueIndex) => {
      const obj = jsShadowHeap.get(objIndex);
      const key = stringForIndex(heap, keyIndex);
      const value = stringForIndex(heap, valueIndex);
      obj[key] = value;
    },
    'Element::appendChild': (elIndex, childIndex) => {
      const el = jsShadowHeap.get(elIndex);
      const child = jsShadowHeap.get(childIndex);
      el.appendChild(child);
    }
  }
};

// Safari doesn't support instantiateStreaming
if (typeof WebAssembly.instantiateStreaming === 'function') {
  WebAssembly.instantiateStreaming(fetch('./main.wasm'), imports)
    .then(result => result.instance.exports.main(), showError);
} else {
  fetch('./main.wasm')
    .then(resp => resp.arrayBuffer())
    .then(buffer => WebAssembly.instantiate(buffer, imports))
    .then(result => result.instance.exports.main(), showError);
}
