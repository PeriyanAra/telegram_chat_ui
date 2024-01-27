import 'package:data/src/database/database_constants.dart';

String createChatTable() {
  return '''
    CREATE TABLE ${DatabaseConstants.chatTableName}
      (
       ${DatabaseConstants.chatIdColumnName} INTEGER PRIMARY KEY,
       ${DatabaseConstants.chatIsOwnerMessageColumnName} TEXT NOT NULL,
       ${DatabaseConstants.chatViewColumnName} TEXT NOT NULL,
       ${DatabaseConstants.chatMessageColumnName} TEXT NOT NULL,
       ${DatabaseConstants.chatTimeColumnName} TEXT NOT NULL
      )
    ''';
}
