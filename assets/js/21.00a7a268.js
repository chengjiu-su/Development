(window.webpackJsonp=window.webpackJsonp||[]).push([[21],{401:function(t,a,s){"use strict";s.r(a);var e=s(46),n=Object(e.a)({},(function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("ContentSlotsDistributor",{attrs:{"slot-key":t.$parent.slotKey}},[s("p",[t._v("[TOC]")]),t._v(" "),s("h2",{attrs:{id:"dlogmanager的使用"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#dlogmanager的使用"}},[t._v("#")]),t._v(" DLogManager的使用")]),t._v(" "),s("p",[s("code",[t._v("DLogManager")]),t._v("是封装在"),s("code",[t._v("dtkcore")]),t._v("的DLog模块中的，所以要使用"),s("code",[t._v("DLogManager")]),t._v("必须要先：\n１、在项目"),s("code",[t._v("pro")]),t._v("文件中加上"),s("code",[t._v("dtkcore")]),t._v(",代码如下：\n　　　"),s("code",[t._v("QT += dtkcore;")]),t._v("\n2、在需要使用到"),s("code",[t._v("DLogManager")]),t._v("的"),s("code",[t._v("cpp")]),t._v("文件中加入包含头文件，代码如下：\n　　　"),s("code",[t._v("#include <DLog>")]),t._v("\n然后就可以通过"),s("code",[t._v("Dtk::Core::DLogManager")]),t._v("的方式直接调用了。")]),t._v(" "),s("p",[s("code",[t._v("DLogManager")]),t._v("的定义的代码部分如下：")]),t._v(" "),s("div",{staticClass:"language-cpp extra-class"},[s("pre",{pre:!0,attrs:{class:"language-cpp"}},[s("code",[s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("class")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token class-name"}},[t._v("LIBDTKCORESHARED_EXPORT")]),t._v(" DLogManager\n"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("{")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("public")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v(":")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("static")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("void")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("registerConsoleAppender")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("static")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("void")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("registerFileAppender")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("static")]),t._v(" QString "),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("getlogFilePath")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("static")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("void")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("setlogFilePath")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("const")]),t._v(" QString"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("&")]),t._v(" logFilePath"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("static")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("void")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("setLogFormat")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("const")]),t._v(" QString"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("&")]),t._v(" format"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(".")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(".")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(".")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("}")]),t._v("\n")])])]),s("p",[t._v("从上面的代码可以看到，"),s("code",[t._v("DLogManager")]),t._v("依次提供了注册控制台日志输出、文件日志输出、获取日志文件设置、设置日志文件、设置日志格式几个常用的函数接口。而且这个几个函数都是以静态函数的方式给出，所以可以直接通过 "),s("code",[t._v("Dtk::Core::DLogManager")]),t._v(" 的方式来调用了。")]),t._v(" "),s("br"),t._v(" "),s("h2",{attrs:{id:"dtk日志模块代码分析"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#dtk日志模块代码分析"}},[t._v("#")]),t._v(" DTK日志模块代码分析")]),t._v(" "),s("h3",{attrs:{id:"dtk日志模块代码分析-2"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#dtk日志模块代码分析-2"}},[t._v("#")]),t._v(" DTK日志模块代码分析")]),t._v(" "),s("p",[t._v("首先，我们先从整体DTK日志模块类的结构以及各类之间的关系来了解一下DTK日志模块。")]),t._v(" "),s("br"),t._v(" "),s("h3",{attrs:{id:"dtk日志模块类图"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#dtk日志模块类图"}},[t._v("#")]),t._v(" DTK日志模块类图")]),t._v(" "),s("img",{attrs:{src:"https://cdn.jsdelivr.net/gh/xmuli/xmuliPic@pic/2020/20201210161840.png",width:"90%"}}),t._v(" "),s("p",[t._v("DTK日志模块类图")]),t._v(" "),s("p",[t._v("从类图中可以看到，"),s("code",[t._v("DLogManager")]),t._v("、"),s("code",[t._v("Logger")]),t._v("、"),s("code",[t._v("OutputDebugAppender")]),t._v("是三个最常用的类，它们基本上满足了我们对日志功能的所有需求。")]),t._v(" "),s("br"),t._v(" "),s("h3",{attrs:{id:"dlogmanager"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#dlogmanager"}},[t._v("#")]),t._v(" DLogManager")]),t._v(" "),s("p",[s("code",[t._v("DLogManager")]),t._v("是一个单例类，可通过"),s("code",[t._v("instance()")]),t._v("获取"),s("code",[t._v("DLogManager")]),t._v("单例对象指针。"),s("code",[t._v("DLogManager")]),t._v("中有"),s("code",[t._v("ConsoleAppender")]),t._v("、"),s("code",[t._v("RollingFileAppender")]),t._v("两个指针成员，分别通过两个静态函数registerConsoleAppender()、registerFileAppender()来初始化，注意如果需要使用setLogFormat和setlogFilePath来设置日志格式和保存路径的话就需要在初始化之前设置。初始化好以后就可以通过调用qDebug()写日志了。 DLogManager默认输出日志级别为"),s("code",[t._v("Debug")]),t._v("。DTK可输出六种级别的日志信息，定义如下")]),t._v(" "),s("div",{staticClass:"language-cpp extra-class"},[s("pre",{pre:!0,attrs:{class:"language-cpp"}},[s("code",[s("span",{pre:!0,attrs:{class:"token keyword"}},[t._v("enum")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token class-name"}},[t._v("LogLevel")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("{")]),t._v("\n    Trace"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(",")]),t._v("   "),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("//!< Trace level. Can be used for mostly unneeded records used for internal code tracing.")]),t._v("\n    Debug"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(",")]),t._v("   "),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("//!< Debug level. Useful for non-necessary records used for the debugging of the software.")]),t._v("\n    Info"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(",")]),t._v("    "),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("//!< Info level. Can be used for informational records, which may be interesting for not only developers.")]),t._v("\n    Warning"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(",")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("//!< Warning. May be used to log some non-fatal warnings detected by your application.")]),t._v("\n    Error"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(",")]),t._v("   "),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("//!< Error. May be used for a big problems making your application work wrong but not crashing.")]),t._v("\n    Fatal    "),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("//!< Fatal. Used for unrecoverable errors, crashes the application right after the log record is written.")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("}")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n")])])]),s("br"),t._v(" "),s("h3",{attrs:{id:"logger"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#logger"}},[t._v("#")]),t._v(" Logger")]),t._v(" "),s("p",[s("code",[t._v("Logger")]),t._v("比"),s("code",[t._v("DLogManager")]),t._v("有更多可设置的属性。")]),t._v(" "),s("br"),t._v(" "),s("h3",{attrs:{id:"outputdebugappender"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#outputdebugappender"}},[t._v("#")]),t._v(" OutputDebugAppender")]),t._v(" "),s("p",[s("code",[t._v("OutputDebugAppender")]),t._v("类专门用来输出调试信息。")]),t._v(" "),s("br"),t._v(" "),s("h2",{attrs:{id:"使用日志功能"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#使用日志功能"}},[t._v("#")]),t._v(" 使用日志功能")]),t._v(" "),s("p",[t._v("下面是几个简单的例子：")]),t._v(" "),s("h3",{attrs:{id:"dlogmanager用例代码"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#dlogmanager用例代码"}},[t._v("#")]),t._v(" DLogManager用例代码")]),t._v(" "),s("div",{staticClass:"language-cpp extra-class"},[s("pre",{pre:!0,attrs:{class:"language-cpp"}},[s("code",[s("span",{pre:!0,attrs:{class:"token class-name"}},[t._v("DLogManager")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("::")]),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("registerConsoleAppender")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token class-name"}},[t._v("DLogManager")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("::")]),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("registerFileAppender")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("qDebug")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("<<")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('"logfilepath="')]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("<<")]),s("span",{pre:!0,attrs:{class:"token class-name"}},[t._v("DLogManager")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("::")]),s("span",{pre:!0,attrs:{class:"token function"}},[t._v("getlogFilePath")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")]),t._v("\n")])])]),s("p",[s("code",[t._v("DLogManager")]),t._v("默认日志保存路径是"),s("code",[t._v("QStandardPaths::standardLocations(QStandardPaths::CacheLocation)")]),t._v("获取到的列表中的第一个，默认路径为"),s("code",[t._v("/home/$UserName$/$AppName$/$AppName$.log")]),t._v("，也就是用户家目录下，"),s("code",[t._v("$UserName$")]),t._v("是用户名，"),s("code",[t._v("$AppName$")]),t._v("是应用程序名。日志文件名为"),s("code",[t._v("qApp->applicationName()")]),t._v("获取到的应用程序名。")])])}),[],!1,null,null,null);a.default=n.exports}}]);