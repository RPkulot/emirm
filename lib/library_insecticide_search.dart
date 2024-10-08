import 'package:eirmuplb/model/pesticide.dart';
import 'package:flutter/material.dart';

import 'database/asset_database.dart';
import 'model/fpalist.dart';

class FPAPesticidesList extends StatefulWidget {
  final moagroup;
  List<FPAListModel> pesticides;

  FPAPesticidesList(List<FPAListModel> this.pesticides, this.moagroup);
  @override
  State<FPAPesticidesList> createState() => _FPAPesticidesListState();
}
class _FPAPesticidesListState extends State<FPAPesticidesList> {

  bool sort = true;
  late List<FPAListModel> fpalist;
  // List<Data>? filterData;
  List<FPAListModel> filteredFPAdata = [];

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filteredFPAdata.sort((a, b) => a.moagroup.compareTo(b.moagroup));
      } else {
        filteredFPAdata.sort((a, b) => b.moagroup.compareTo(a.moagroup));
      }
    }
  }

  @override
  void initState() {
    filteredFPAdata = widget.pesticides;
    // getfpalist();
    super.initState();
  }


  // Future getfpalist() async {
  //   fpalist = await EIRMAssetDatabase.instance.fpaList();
  //   filteredFPAdata = fpalist;
  // }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Theme(
                  data: ThemeData.light()
                      .copyWith(cardColor: Theme.of(context).canvasColor),
                  child: Scrollbar(
                    controller: ScrollController(),
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: PaginatedDataTable(
                      controller: ScrollController(),
                      sortColumnIndex: 0,
                      sortAscending: sort,
                      header: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              hintText: "Enter something to filter"),
                          onChanged: (value) {
                            // setState(() {
                            //   fpalist = filteredFPAdata
                            //       .where((element) =>
                            //       element.moagroup.contains(value))
                            //       .toList();
                            // });
                            setState(() {
                              filteredFPAdata = value.isEmpty
                                  ? widget.pesticides
                                  : widget.pesticides
                                  .where((item) =>
                              item.activeingredient.toLowerCase().contains(value.toLowerCase()) ||
                                  item.chemicalgroup.toLowerCase().contains(value.toLowerCase()))
                                  .toList();
                            });
                          },
                        ),
                      ),
                      source: RowSource(
                        myData: filteredFPAdata,
                        count: filteredFPAdata.length,
                      ),
                      rowsPerPage: 8,
                      columnSpacing: 8,
                      columns: [
                        DataColumn(
                            label: const Text(
                              "moa group",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                sort = !sort;
                              });

                              onsortColum(columnIndex, ascending);
                            }),
                        const DataColumn(
                          label: Text(
                            "active ingredient",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "chemical group",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "product name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "company",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.moagroup ?? "moa")),
      DataCell(Text(data.activeingredient)),
      DataCell(Text(data.chemicalgroup)),
      DataCell(Text(data.productname)),
      DataCell(Text(data.company)),
    ],
  );
}