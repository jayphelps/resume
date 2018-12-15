(module
  (import "env" "memory" (memory 1))
  (import "env" "document.body" (global $document.body i32))
  (import "env" "log" (func $log (param i32)))
  (import "env" "Object::get" (func $Object::get (param i32 i32) (result i32)))
  (import "env" "Object::set" (func $Object::set (param i32 i32 i32)))
  (import "env" "document.createElement" (func $document.createElement (param i32) (result i32)))
  (import "env" "Element::appendChild" (func $Element::appendChild (param i32 i32)))

  (func $createWasmBanner (result i32)
    (local $div i32)
    (call $Object::set
      (tee_local $div
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $innerTextString)
      (get_global $wasmBannerText)
    )
    (call $Object::set
      (get_local $div)
      (get_global $classNameString)
      (get_global $wasmBannerClassNameString)
    )
    (call $Element::appendChild
      (get_local $div)
      (call $createAnchor
        (get_global $sourceCodeUrlText)
        (get_global $viewItHereText)
      )
    )
    (get_local $div)
  )
  (func $createHeader (result i32)
    (local $header i32)
    (local $h1 i32)
    (local $contact i32)
    (local $desc i32)
    (set_local $header
      (call $document.createElement
        (get_global $headerString)
      )
    )
    (call $Object::set
      (tee_local $h1
        (call $document.createElement
          (get_global $h1String)
        )
      )
      (get_global $innerTextString)
      (get_global $nameText)
    )
    (call $Element::appendChild
      (get_local $header)
      (get_local $h1)
    )
    (call $Object::set
      (tee_local $contact
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $innerTextString)
      (get_global $contactText)
    )
    (call $Element::appendChild
      (get_local $header)
      (get_local $contact)
    )
    (call $Object::set
      (tee_local $desc
        (call $document.createElement
          (get_global $pString)
        )
      )
      (get_global $innerTextString)
      (get_global $descText)
    )
    (call $Element::appendChild
      (get_local $header)
      (get_local $desc)
    )
    (get_local $header)
  )
  (func $createExperienceItem (param $companyText i32) (param $titleText i32) (param $dateText i32) (param $descText i32) (result i32)
    (local $li i32)
    (local $company i32)
    (local $title i32)
    (local $date i32)
    (local $desc i32)
    (set_local $li
      (call $document.createElement
        (get_global $liString)
      )
    )
    (call $Object::set
      (tee_local $company
        (call $document.createElement
          (get_global $h3String)
        )
      )
      (get_global $innerTextString)
      (get_local $companyText)
    )
    (call $Object::set
      (get_local $company)
      (get_global $classNameString)
      (get_global $jobCompanyClassNameText)
    )
    (call $Element::appendChild
      (get_local $li)
      (get_local $company)
    )
    (call $Object::set
      (tee_local $title
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $innerTextString)
      (get_local $titleText)
    )
    (call $Object::set
      (get_local $title)
      (get_global $classNameString)
      (get_global $jobTitleClassNameText)
    )
    (call $Element::appendChild
      (get_local $li)
      (get_local $title)
    )
    (call $Object::set
      (tee_local $date
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $innerTextString)
      (get_local $dateText)
    )
    (call $Object::set
      (get_local $date)
      (get_global $classNameString)
      (get_global $jobDateClassNameText)
    )
    (call $Element::appendChild
      (get_local $li)
      (get_local $date)
    )
    (call $Object::set
      (tee_local $desc
        (call $document.createElement
          (get_global $pString)
        )
      )
      (get_global $innerTextString)
      (get_local $descText)
    )
    (call $Object::set
      (get_local $desc)
      (get_global $classNameString)
      (get_global $jobDescClassNameText)
    )
    (call $Element::appendChild
      (get_local $li)
      (get_local $desc)
    )
    (get_local $li)
  )
  (func $createExperienceSection (result i32)
    (local $section i32)
    (local $h2 i32)
    (local $ol i32)
    (local $prevEmp i32)
    (set_local $section
      (call $document.createElement
        (get_global $sectionString)
      )
    )
    (call $Object::set
      (tee_local $h2
        (call $document.createElement
          (get_global $h2String)
        )
      )
      (get_global $innerTextString)
      (get_global $experienceText)
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $h2)
    )
    (set_local $ol
      (call $document.createElement
        (get_global $olString)
      )
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $ol)
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createExperienceItem
        (get_global $jobCompany1)
        (get_global $jobTitle1)
        (get_global $jobDate1)
        (get_global $jobDesc1)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createExperienceItem
        (get_global $jobCompany2)
        (get_global $jobTitle2)
        (get_global $jobDate2)
        (get_global $jobDesc2)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createExperienceItem
        (get_global $jobCompany3)
        (get_global $jobTitle3)
        (get_global $jobDate3)
        (get_global $jobDesc3)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createExperienceItem
        (get_global $jobCompany4)
        (get_global $jobTitle4)
        (get_global $jobDate4)
        (get_global $jobDesc4)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createExperienceItem
        (get_global $jobCompany5)
        (get_global $jobTitle5)
        (get_global $jobDate5)
        (get_global $jobDesc5)
      )
    )
    (call $Object::set
      (tee_local $prevEmp
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $classNameString)
      (get_global $previousEmploymentClassNameString)
    )
    (call $Object::set
      (get_local $prevEmp)
      (get_global $innerTextString)
      (get_global $previousEmploymentText)
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $prevEmp)
    )
    (get_local $section)
  )
  (func $createTalkItem (param $titleText i32) (param $hrefText i32) (result i32)
    (local $li i32)
    (local $div1 i32)
    (local $div2 i32)
    (set_local $li
      (call $document.createElement
        (get_global $liString)
      )
    )
    (call $Object::set
      (tee_local $div1
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $innerTextString)
      (get_local $titleText)
    )
    (call $Element::appendChild
      (get_local $li)
      (get_local $div1)
    )
    (call $Element::appendChild
      (get_local $li)
      (tee_local $div2
        (call $document.createElement
          (get_global $divString)
        )
      )
    )
    (call $Element::appendChild
      (get_local $div2)
      (call $createAnchor
        (get_local $hrefText)
        (get_local $hrefText)
      )
    )
    (get_local $li)
  )
  (func $createAnchor (param $href i32) (param $text i32) (result i32)
    (local $anchor i32)
    (call $Object::set
      (tee_local $anchor
        (call $document.createElement
          (get_global $aString)
        )
      )
      (get_global $hrefString)
      (get_local $href)
    )
    (call $Object::set
      (get_local $anchor)
      (get_global $innerTextString)
      (get_local $text)
    )
    (get_local $anchor)
  )
  (func $createTalks (result i32)
    (local $section i32)
    (local $h2 i32)
    (local $ol i32)
    (set_local $section
      (call $document.createElement
        (get_global $sectionString)
      )
    )
    (call $Object::set
      (tee_local $h2
        (call $document.createElement
          (get_global $h2String)
        )
      )
      (get_global $innerTextString)
      (get_global $talksText)
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $h2)
    )
    (set_local $ol
      (call $document.createElement
        (get_global $olString)
      )
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $ol)
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createTalkItem
        (get_global $talkTitle1)
        (get_global $talkHref1)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createTalkItem
        (get_global $talkTitle2)
        (get_global $talkHref2)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createTalkItem
        (get_global $talkTitle3)
        (get_global $talkHref3)
      )
    )
    (get_local $section)
  )
  (func $createSocialItem (param $titleText i32) (param $hrefText i32) (param $usernameText i32) (result i32)
    (local $li i32)
    (local $div1 i32)
    (set_local $li
      (call $document.createElement
        (get_global $liString)
      )
    )
    (call $Object::set
      (tee_local $div1
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $innerTextString)
      (get_local $titleText)
    )
    (call $Element::appendChild
      (get_local $div1)
      (call $createAnchor
        (get_local $hrefText)
        (get_local $usernameText)
      )
    )
    (call $Element::appendChild
      (get_local $li)
      (get_local $div1)
    )
    (get_local $li)
  )
  (func $createSocial (result i32)
    (local $section i32)
    (local $h2 i32)
    (local $ol i32)
    (set_local $section
      (call $document.createElement
        (get_global $sectionString)
      )
    )
    (call $Object::set
      (tee_local $h2
        (call $document.createElement
          (get_global $h2String)
        )
      )
      (get_global $innerTextString)
      (get_global $socialText)
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $h2)
    )
    (set_local $ol
      (call $document.createElement
        (get_global $olString)
      )
    )
    (call $Element::appendChild
      (get_local $section)
      (get_local $ol)
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createSocialItem
        (get_global $twitterText)
        (get_global $twitterUrlText)
        (get_global $twitterUsernameText)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createSocialItem
        (get_global $GitHubText)
        (get_global $GitHubUrlText)
        (get_global $GitHubUsernameText)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createSocialItem
        (get_global $StackOverflowText)
        (get_global $StackOverflowUrlText)
        (get_global $StackOverflowUsernameText)
      )
    )
    (call $Element::appendChild
      (get_local $ol)
      (call $createSocialItem
        (get_global $MediumText)
        (get_global $MediumUrlText)
        (get_global $MediumUsernameText)
      )
    )
    (get_local $section)
  )
  (func $createResume (result i32)
    (local $resume i32)
    (local $resumeLeftColumn i32)
    (local $resumeRightColumn i32)
    (call $Object::set
      (tee_local $resume
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $classNameString)
      (get_global $resumeClassNameString)
    )
    (call $Object::set
      (tee_local $resumeLeftColumn
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $classNameString)
      (get_global $resumeLeftColumnClassNameString)
    )
    (call $Object::set
      (tee_local $resumeRightColumn
        (call $document.createElement
          (get_global $divString)
        )
      )
      (get_global $classNameString)
      (get_global $resumeRightColumnClassNameString)
    )
    (call $Element::appendChild
      (get_local $resume)
      (get_local $resumeLeftColumn)
    )
    (call $Element::appendChild
      (get_local $resumeLeftColumn)
      (call $createHeader)
    )
    (call $Element::appendChild
      (get_local $resumeLeftColumn)
      (call $createExperienceSection)
    )
    (call $Element::appendChild
      (get_local $resume)
      (get_local $resumeRightColumn)
    )
    (call $Element::appendChild
      (get_local $resumeRightColumn)
      (call $createTalks)
    )
    (call $Element::appendChild
      (get_local $resumeRightColumn)
      (call $createSocial)
    )
    (get_local $resume)
  )
  (func $main (export "main")
    (call $Element::appendChild
      (get_global $document.body)
      (call $createWasmBanner)
    )
    (call $Element::appendChild
      (get_global $document.body)
      (call $createResume)
    )
  )

  (global $divString i32 (i32.const 2))
  (global $aString i32 (i32.const 6))
  (global $pString i32 (i32.const 8))
  (global $headerString i32 (i32.const 10))
  (global $sectionString i32 (i32.const 17))
  (global $olString i32 (i32.const 25))
  (global $liString i32 (i32.const 28))
  (global $h1String i32 (i32.const 31))
  (global $h2String i32 (i32.const 34))
  (global $h3String i32 (i32.const 37))
  (global $classNameString i32 (i32.const 40))
  (global $hrefString i32 (i32.const 50))
  (global $innerTextString i32 (i32.const 55))
  (global $wasmBannerClassNameString i32 (i32.const 65))
  (global $wasmBannerText i32 (i32.const 77))
  (global $viewItHereText i32 (i32.const 154))
  (global $resumeClassNameString i32 (i32.const 168))
  (global $resumeLeftColumnClassNameString i32 (i32.const 175))
  (global $resumeRightColumnClassNameString i32 (i32.const 194))
  (global $nameText i32 (i32.const 214))
  (global $contactText i32 (i32.const 225))
  (global $descText i32 (i32.const 261))
  (global $jobCompanyClassNameText i32 (i32.const 493))
  (global $jobTitleClassNameText i32 (i32.const 505))
  (global $jobDateClassNameText i32 (i32.const 515))
  (global $jobDescClassNameText i32 (i32.const 524))
  (global $experienceText i32 (i32.const 533))
  (global $jobCompany1 i32 (i32.const 544))
  (global $oldjobTitle1 i32 (i32.const 559))
  (global $oldjobDate1 i32 (i32.const 584))
  (global $jobDesc1 i32 (i32.const 639))
  (global $jobCompany2 i32 (i32.const 844))
  (global $jobTitle2 i32 (i32.const 858))
  (global $jobDate2 i32 (i32.const 883))
  (global $jobDesc2 i32 (i32.const 904))
  (global $jobCompany3 i32 (i32.const 1165))
  (global $jobTitle3 i32 (i32.const 1182))
  (global $jobDate3 i32 (i32.const 1207))
  (global $jobDesc3 i32 (i32.const 1227))
  (global $jobCompany4 i32 (i32.const 1342))
  (global $jobTitle4 i32 (i32.const 1382))
  (global $jobDate4 i32 (i32.const 1406))
  (global $jobDesc4 i32 (i32.const 1426))
  (global $jobCompany5 i32 (i32.const 1710))
  (global $jobTitle5 i32 (i32.const 1742))
  (global $jobDate5 i32 (i32.const 1757))
  (global $jobDesc5 i32 (i32.const 0))
  (global $previousEmploymentClassNameString i32 (i32.const 1777))
  (global $previousEmploymentText i32 (i32.const 1797))
  (global $talksText i32 (i32.const 1840))
  (global $talkTitle1 i32 (i32.const 1846))
  (global $talkHref1 i32 (i32.const 1870))
  (global $talkTitle2 i32 (i32.const 1892))
  (global $talkHref2 i32 (i32.const 1924))
  (global $talkTitle3 i32 (i32.const 1946))
  (global $talkHref3 i32 (i32.const 1997))
  (global $socialText i32 (i32.const 2019))
  (global $twitterText i32 (i32.const 2026))
  (global $twitterUrlText i32 (i32.const 2036))
  (global $twitterUsernameText i32 (i32.const 2183))
  (global $GitHubText i32 (i32.const 2078))
  (global $GitHubUrlText i32 (i32.const 2087))
  (global $GitHubUsernameText i32 (i32.const 2067))
  (global $StackOverflowText i32 (i32.const 2116))
  (global $StackOverflowUrlText i32 (i32.const 2133))
  (global $StackOverflowUsernameText i32 (i32.const 2067))
  (global $MediumText i32 (i32.const 2195))
  (global $MediumUrlText i32 (i32.const 2204))
  (global $MediumUsernameText i32 (i32.const 2067))
  (global $sourceCodeUrlText i32 (i32.const 2234))
  (global $jobTitle1 i32 (i32.const 2288))
  (global $jobDate1 i32 (i32.const 2299))

  (data (i32.const 2) "div\00")
  (data (i32.const 6) "a\00")
  (data (i32.const 8) "p\00")
  (data (i32.const 10) "header\00")
  (data (i32.const 17) "section\00")
  (data (i32.const 25) "ol\00")
  (data (i32.const 28) "li\00")
  (data (i32.const 31) "h1\00")
  (data (i32.const 34) "h2\00")
  (data (i32.const 37) "h3\00")
  (data (i32.const 40) "className\00")
  (data (i32.const 50) "href\00")
  (data (i32.const 55) "innerText\00")
  (data (i32.const 65) "wasm-banner\00")
  (data (i32.const 77) "This page was generated using hand-written WebAssembly text just for kicks. \00")
  (data (i32.const 154) "View it here.\00")
  (data (i32.const 168) "resume\00")
  (data (i32.const 175) "resume-left-column\00")
  (data (i32.const 194) "resume-right-column\00")
  (data (i32.const 214) "Jay Phelps\00")
  (data (i32.const 225) "hello@jayphelps.com - Knoxville, TN\00")
  (data (i32.const 261) "Reactive Programming expert, compiler enthusiast, open source contributor, and speaker. WebAssembly Community Group member. Google Developer Expert. Author of core-decorators, co-author of redux-observable, and RxJS core team alum.\00")
  (data (i32.const 493) "job-company\00")
  (data (i32.const 505) "job-title\00")
  (data (i32.const 515) "job-date\00")
  (data (i32.const 524) "job-desc\00")
  (data (i32.const 533) "Experience\00")
  (data (i32.const 544) "This Dot, Inc.\00")
  (data (i32.const 639) "Lead the architecture of client projects, provide client support and mentoring on open source projects such as RxJS and Redux Observable, remotely pair program with clients, employees, and subcontractors.\00")
  (data (i32.const 844) "Netflix, Inc.\00")
  (data (i32.const 858) "Senior Software Engineer\00")
  (data (i32.const 883) "Jan 2015 - Feb 2018\00")
  (data (i32.const 904) "Developer Experience. Build internal applications, frameworks, and libraries with a focus on real-time debugging. Helped in the rewrite of RxJS v5 with a focus on performance, better debuggability, and bundle sizes. Supported developers across Netflix in RxJS.\00")
  (data (i32.const 1165) "Pivotshare, Inc.\00")
  (data (i32.const 1182) "Chief Technology Officer\00")
  (data (i32.const 1207) "May 2013 - Jan 2015\00")
  (data (i32.const 1227) "Engineering lead and individual contributor for a video-on-demand platform; think \"Netflix platform as a service\".\00")
  (data (i32.const 1342) "SignNow, acquired by Barracuda Networks\00")
  (data (i32.const 1382) "Lead Front End Engineer\00")
  (data (i32.const 1406) "Oct 2011 - May 2013\00")
  (data (i32.const 1426) "Lead the development of our e-signing web app in JavaScript. Created PDF manipulation utilities (written in C++) that solved performance issues with our previous PHP-based solutions. Also created Objective-C++ bindings for it that were utilized in our iOS app for offline capability.\00")
  (data (i32.const 1710) "XOWii, acquired by Evolv Health\00")
  (data (i32.const 1742) "Lead Developer\00")
  (data (i32.const 1757) "Dec 2009 - Oct 2011\00")
  (data (i32.const 1777) "previous-employment\00")
  (data (i32.const 1797) "Previous employment available upon request\00")
  (data (i32.const 1840) "Talks\00")
  (data (i32.const 1846) "WebAssembly Demystified\00")
  (data (i32.const 1870) "https://goo.gl/NBEvmp\00")
  (data (i32.const 1892) "RxJS + Redux + React = Amazing!\00")
  (data (i32.const 1924) "https://goo.gl/fy89o7\00")
  (data (i32.const 1946) "Real-time Insights Powered by Reactive Programming\00")
  (data (i32.const 1997) "https://goo.gl/C7xvyv\00")
  (data (i32.const 2019) "Social\00")
  (data (i32.const 2026) "Twitter: \00")
  (data (i32.const 2036) "https://twitter.com/_jayphelps\00")
  (data (i32.const 2067) "@jayphelps\00")
  (data (i32.const 2078) "GitHub: \00")
  (data (i32.const 2087) "https://github.com/jayphelps\00")
  (data (i32.const 2116) "Stack Overflow: \00")
  (data (i32.const 2133) "https://stackoverflow.com/users/1770633/jayphelps\00")
  (data (i32.const 2183) "@_jayphelps\00")
  (data (i32.const 2195) "Medium: \00")
  (data (i32.const 2204) "https://medium.com/@jayphelps\00")
  (data (i32.const 2234) "https://github.com/jayphelps/_/blob/gh-pages/main.wat\00")
  (data (i32.const 2288) "Co-founder\00")
  (data (i32.const 2299) "June 2017 (part-time) - Feb 2018 (full-time) - Dec 2018\00")
)
