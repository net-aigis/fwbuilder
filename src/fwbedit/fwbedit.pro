#-*- mode: makefile; tab-width: 4; -*-
#
include(../../qmake.inc)
#
#

TEMPLATE = app
QT += network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

SOURCES	 = fwbedit.cpp new_object.cpp repair_tree.cpp list_object.cpp merge.cpp import.cpp
HEADERS	 = ../../config.h fwbedit.h upgradePredicate.h

INCLUDEPATH += ../libfwbuilder/src ../import ../compiler_lib ../libgui
DEPENDPATH +=  ../libfwbuilder/src ../import ../compiler_lib ../libgui

win32:INCLUDEPATH += ../libgui/ui
!win32:INCLUDEPATH += ../libgui/.ui

TARGET = fwbedit

!win32 {
	QMAKE_COPY    = ../../install.sh -m 0755
}

PRE_TARGETDEPS  = ../common/$$BINARY_SUBDIR/libcommon.a \
      ../parsers/$$BINARY_SUBDIR/libfwbparser.a \
      ../import/$$BINARY_SUBDIR/libimport.a \
      ../compiler_lib/$$BINARY_SUBDIR/libcompilerdriver.a \
      ../libgui/$$BINARY_SUBDIR/libgui.a \
      ../libfwbuilder/src/fwcompiler/$$BINARY_SUBDIR/libfwcompiler.a \
      ../libfwbuilder/src/fwbuilder/$$BINARY_SUBDIR/libfwbuilder.a \

# MinGW ld is single-pass: parsers reference PFImporter, so import must
# follow parsers; wrap on win32 in case of remaining static cycles.
!win32:LIBS += $$PRE_TARGETDEPS $$ANTLR_LIBS $$LIBS
win32:LIBS += -Wl,--start-group $$PRE_TARGETDEPS $$ANTLR_LIBS -Wl,--end-group $$LIBS

win32:CONFIG += console


