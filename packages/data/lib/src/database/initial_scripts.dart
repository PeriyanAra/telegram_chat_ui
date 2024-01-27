import 'package:data/src/database/tables/chart_table.dart';

List<String> initialScripts() {
  return [
    createChatTable(),
  ];
}
