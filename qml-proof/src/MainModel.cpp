#include "MainModel.h"

mainModel::mainModel(QObject* parent)
  : QObject(parent)
  , text1_("algo")
  , text2_("nada")
  , screen_("")
  , cursorShape_(Qt::OpenHandCursor)
{}

QString
mainModel::setText1(const QString& text)
{
  if (text1_ != text) {
    text1_ = text;
    Q_EMIT text1Changed();
  }
  return text1_;
}

QString
mainModel::setText2(const QString& text)
{
  if (text2_ != text) {
    text2_ = text;
    Q_EMIT text2Changed();
  }
  return text2_;
}

QString
mainModel::setScreen(const QString& screen)
{
  if (screen_ != screen) {
    screen_ = screen;
    Q_EMIT screenChanged();
  }
  return screen_;
}

Qt::CursorShape
mainModel::setCursorShape(const Qt::CursorShape& shape)
{
  if (cursorShape_ != shape) {
    cursorShape_ = shape;
    Q_EMIT cursorShapeChanged();
  }
  return cursorShape_;
}
