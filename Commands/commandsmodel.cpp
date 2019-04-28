#include "commandsmodel.h"
#include <QDebug>
#include <QFile>
#include <QXmlStreamReader>
#include <QStandardPaths>

CommandsModel::CommandsModel(QObject *parent) : QAbstractListModel(parent)
{
    ReadCommandsFromXml();
}

CommandsModel::~CommandsModel()
{
    WriteCommandsToXml();
}

int CommandsModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant CommandsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case CommandRole:
        return m_data.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CommandsModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[CommandRole] = "command";

    return roles;
}

void CommandsModel::add(QString command)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(command);
    endInsertRows();

    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
}

void CommandsModel::ReadCommandsFromXml()
{
    QString path = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation).first();
    path+="/1.xml";
    QFile file(path);
    if(!file.open(QFile::ReadOnly | QFile::Text)){
        qDebug() << "Cannot read file" << file.errorString();
        return;
    }

    QXmlStreamReader xml(&file);

    while (!xml.atEnd() && !xml.hasError())
    {

        QXmlStreamReader::TokenType token = xml.readNext();
        if (token == QXmlStreamReader::StartDocument)
            continue;
        if (token == QXmlStreamReader::StartElement)
        {
            if (xml.name() == "items")
                continue;
            if (xml.name() == "item")
                m_data.append(xml.readElementText());
        }
    }

    file.close();
}

void CommandsModel::WriteCommandsToXml()
{
    QString path = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation).first();
    path+="/1.xml";
    QFile file(path);
    if(file.exists())
        file.remove();

    file.open(QIODevice::WriteOnly);
    QXmlStreamWriter xmlWriter(&file);

    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();

    xmlWriter.writeStartElement("items");

    for (auto i=0;i<m_data.size();i++) {
        xmlWriter.writeStartElement("item");
        xmlWriter.writeCharacters(m_data.at(i));
        xmlWriter.writeEndElement();
    }


    xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();
    file.close();
}
