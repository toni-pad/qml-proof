#ifndef mainModel_H
#define mainModel_H

#include <QObject>

class mainModel: public QObject
{
    Q_OBJECT

    //Q_PROPERTY(QString text1  MEMBER text1_  NOTIFY text1Changed)
    Q_PROPERTY(QString text1  READ text1  WRITE setText1  NOTIFY text1Changed)
    Q_PROPERTY(QString text2  READ text2  WRITE setText2  NOTIFY text2Changed)
    Q_PROPERTY(QString screen READ screen WRITE setScreen NOTIFY screenChanged)
    Q_PROPERTY(Qt::CursorShape cursorShape READ cursorShape WRITE setCursorShape NOTIFY cursorShapeChanged)

public:
    mainModel(QObject* parent=nullptr);

    QString screen() const {return screen_;}
    QString text1() const {return text1_;}
    QString text2() const {return text2_;}
    Qt::CursorShape cursorShape() const {return cursorShape_;}

public Q_SLOTS:
    QString setText1(const QString& text);
    QString setText2(const QString& text);
    QString setScreen(const QString& screen);
    Qt::CursorShape setCursorShape(const Qt::CursorShape& shape);

protected:
    QString text1_;
    QString text2_;
    QString screen_;
    Qt::CursorShape cursorShape_;

Q_SIGNALS:
    void text1Changed();
    void text2Changed();
    void screenChanged();
    void cursorShapeChanged();
};

#endif // mainModel_H
