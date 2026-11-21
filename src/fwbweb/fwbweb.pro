#-*- mode: makefile; tab-width: 4; -*-
#
# Thin JSON Lines bridge over libfwbuilder for the WebUI backend.
# Does not change compiler or GUI behaviour.
#
include(../../qmake.inc)

TEMPLATE = app
QT -= gui
QT += core
CONFIG += console

SOURCES = main.cpp
HEADERS = ../../config.h upgradePredicate.h

INCLUDEPATH += ../libfwbuilder/src ../common
DEPENDPATH  += ../libfwbuilder/src ../common

TARGET = fwbweb

!win32 {
    QMAKE_COPY = ../../install.sh -m 0755
}

PRE_TARGETDEPS = ../common/$$BINARY_SUBDIR/libcommon.a \
      ../libfwbuilder/src/fwbuilder/$$BINARY_SUBDIR/libfwbuilder.a

LIBS += $$PRE_TARGETDEPS $$LIBS

win32:CONFIG += console
