(window.webpackJsonp=window.webpackJsonp||[]).push([[67],{434:function(e,t,a){"use strict";a.r(t);var s=a(46),r=Object(s.a)({},(function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("ContentSlotsDistributor",{attrs:{"slot-key":e.$parent.slotKey}},[a("p",{attrs:{align:"center"}},[a("img",{attrs:{src:"https://user-images.githubusercontent.com/56656996/99621835-b2d8dc80-29dd-11eb-8183-987e80f8b3a7.png"}})]),e._v(" "),a("h1",{attrs:{align:"center"}},[a("a",{attrs:{href:"https://github.com/dekzi/dde-store"}},[e._v("DDE Store")])]),e._v(" "),a("h3",{attrs:{align:"center"}},[e._v("An app store for DDE built with DTK")]),e._v(" "),a("p",{attrs:{align:"center"}},[e._v("Created by "),a("a",{attrs:{href:"https://dekzi.github.io/"}},[e._v("dekzi")])]),e._v(" "),a("h2",{attrs:{id:"libraries-used"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#libraries-used"}},[e._v("#")]),e._v(" Libraries Used:")]),e._v(" "),a("p",[a("strong",[e._v("PackageKit")]),e._v(" - Interacting with and managing system packages")]),e._v(" "),a("p",[a("strong",[e._v("AppStream")]),e._v(" - Collecting app data for packages (information and metadata)")]),e._v(" "),a("p",[a("strong",[e._v("Snapd")]),e._v(" - Optional Snap support (obviously)")]),e._v(" "),a("h2",{attrs:{id:"file-structure"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#file-structure"}},[e._v("#")]),e._v(" File Structure")]),e._v(" "),a("p",[e._v("Each file is categorized into a specific folder. Most of these folders are fairly straightforward, except for \"backend\" which may seem a bit more vague. The \"backend\" folder contains the files which manage and interact with the app's libraries, as well as the application settings. The 3 files which aren't in a folder are main.cpp, mainwindow.cpp, and mainwindow.h - as they're the main program files, I didn't categorize them and just kept them in the root directory.")]),e._v(" "),a("h2",{attrs:{id:"main-window"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#main-window"}},[e._v("#")]),e._v(" Main Window")]),e._v(" "),a("p",[e._v("The main window creates the UI such as the sidebar, and manages all of the pages. The sidebar is just a simple DListView which controls the pages with a QStackedWidget. For any page opened which doesn't have a corresponding entry in the sidebar, the QStackedWidget will independently open it and clear the DListView's selected entry.")]),e._v(" "),a("h2",{attrs:{id:"backend"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#backend"}},[e._v("#")]),e._v(" Backend")]),e._v(" "),a("p",[e._v("The backend files (dealing with the libraries) are a bit tricky. A lot of it is a mix of synchronous and asynchronous, so the front end has to adapt for both. That's why you may see some functions requiring the front end as an argument - so that data can be returned when the asynchronous task is complete. If the asynchronous task has trackable progress, the front end uses a DProgressBar. If not, a DSpinner is used instead.")]),e._v(" "),a("h2",{attrs:{id:"widgets"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#widgets"}},[e._v("#")]),e._v(" Widgets")]),e._v(" "),a("p",[e._v('I only create custom widgets in the "widgets" folder if there would be more than one use from more than one file. Some of theseof these widgets are just other widgets configured in a specific way, like "list.cpp" is a configured DListView. Others may be completely custom or a mix of other widgets, such as the image galleries or the star rating icons.')]),e._v(" "),a("h2",{attrs:{id:"source-code"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#source-code"}},[e._v("#")]),e._v(" Source Code")]),e._v(" "),a("p",[e._v("If you want to take a look around the source code and see the way that I used both DTK widgets and DTK's features to interact with the system, you can check out "),a("a",{attrs:{href:"https://github.com/dekzi/dde-store",target:"_blank",rel:"noopener noreferrer"}},[e._v("the project's GitHub"),a("OutboundLink")],1),e._v("!")])])}),[],!1,null,null,null);t.default=r.exports}}]);