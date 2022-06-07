#include "ValuesFromC.h"
#include <QDebug>

QString ValuesFromC::name() const
{
    return m_name;
}

void ValuesFromC::setName(const QString &name)
{
    if ( name == m_name )
        return;
    m_name = name;
    emit nameChanged();
}

void ValuesFromC::onButtonClicked(const QString &str)
{
    qDebug() << str;
}
void ValuesFromC::onButtonClicked2(const QString &str)
{
    qDebug() << str;
}
