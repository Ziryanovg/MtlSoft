#ifndef COMMANDSMODEL_H
#define COMMANDSMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QStringList>

class CommandsModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
            CommandRole = Qt::UserRole + 1
        };

    explicit CommandsModel(QObject *parent = nullptr);

    ~CommandsModel();

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void add(QString command);



private:
    QStringList m_data;
    void ReadCommandsFromXml();
    void WriteCommandsToXml();

signals:

public slots:
};

#endif // COMMANDSMODEL_H
