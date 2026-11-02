#include "MDIEventFilter.h"
#include <QObject>
#include <QDebug>
#include <QWheelEvent>
#include <QApplication>
#include <QWidget>

bool MDIEventFilter::eventFilter(QObject *obj, QEvent *event)
{
    if (event->type() == QEvent::Wheel)
    {
        event->accept();
        return true;
    }
    else
    {
        return QObject::eventFilter(obj, event);
    }
}
