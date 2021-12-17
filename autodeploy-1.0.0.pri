#------------------------------------------------------------------------------
# AutoDeploy v1.0.0
# João Pagotto
#------------------------------------------------------------------------------
#
# usage in .pro file:
#
# DESTDIR = $${PWD}/build
#
# include(autodeploy-1.0.0.pri)
# include(..others..)
# include(..others..)
#
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Windows compiler Microsoft Visual C++ x32/x64
#------------------------------------------------------------------------------

win32-msvc {

    TOOL_DEPLOY = $$QMAKE_QMAKE
    TOOL_DEPLOY = $$replace(TOOL_DEPLOY, qmake.exe, windeployqt.exe)

    contains(QT, quick) {
        QML_DIR = $$QMAKE_QMAKE
        QML_DIR = $$replace(QML_DIR, bin/qmake.exe, qml)
    }

    #------------------------

    contains(QT_ARCH, i386) {
        DESTDIR = $${DESTDIR}/msvc_x32
    } else {    
        DESTDIR = $${DESTDIR}/msvc_x64
    }

    CONFIG(debug, debug|release) {
        DESTDIR = $${DESTDIR}/debug
    } else {
        DESTDIR = $${DESTDIR}/release
    }

    DESTDIR = $$system_path($${DESTDIR})

    #------------------------

    TARGET_CUSTOM_EXT = $${TARGET_EXT}

    isEmpty(TARGET_CUSTOM_EXT) {
        win32 {
            TARGET_CUSTOM_EXT = .exe
        }
        macx {
            TARGET_CUSTOM_EXT = .app
        }
    }

    #------------------------

    DEPLOY  = $${TOOL_DEPLOY}
    DEPLOY += --no-translations
    DEPLOY += --dir $$system_path($${DESTDIR})
    DEPLOY += $$system_path($${DESTDIR}/$${TARGET}$${TARGET_CUSTOM_EXT})
    contains(QT, quick) {
        DEPLOY += --qmldir $$system_path($${QML_DIR})
    }
    DEPLOY += $$escape_expand(\n\t)

    QMAKE_POST_LINK += $${DEPLOY}

}

#------------------------------------------------------------------------------
# Windows compiler MinGW x32/x64
#------------------------------------------------------------------------------

win32-g++ {

    TOOL_DEPLOY = $$QMAKE_QMAKE
    TOOL_DEPLOY = $$replace(TOOL_DEPLOY, qmake.exe, windeployqt.exe)

    contains(QT, quick) {
        QML_DIR = $$QMAKE_QMAKE
        QML_DIR = $$replace(QML_DIR, bin/qmake.exe, qml)
    }

    #------------------------

    contains(QT_ARCH, i386) {
        DESTDIR = $${DESTDIR}/mingw_x32
    } else {
        DESTDIR = $${DESTDIR}/mingw_x64
    }

    CONFIG(debug, debug|release) {
        DESTDIR = $${DESTDIR}/debug
    } else {
        DESTDIR = $${DESTDIR}/release
    }

    DESTDIR = $$system_path($${DESTDIR})

    #------------------------

    TARGET_CUSTOM_EXT = $${TARGET_EXT}

    isEmpty(TARGET_CUSTOM_EXT) {
        win32 {
            TARGET_CUSTOM_EXT = .exe
        }
        macx {
            TARGET_CUSTOM_EXT = .app
        }
    }

    #------------------------

    DEPLOY  = $${TOOL_DEPLOY}
    DEPLOY += --no-translations
    DEPLOY += --dir $$system_path($${DESTDIR})
    DEPLOY += $$system_path($${DESTDIR}/$${TARGET}$${TARGET_CUSTOM_EXT})
    contains(QT, quick) {
        DEPLOY += --qmldir $$system_path($${QML_DIR})
    }
    DEPLOY += $$escape_expand(\n\t)

    QMAKE_POST_LINK += $${DEPLOY}

}

#------------------------------------------------------------------------------
# Linux compiler G++ x32/x64
#------------------------------------------------------------------------------

# in development

#------------------------------------------------------------------------------
# MacOSX compiler clang x32/x64
#------------------------------------------------------------------------------

# in development
