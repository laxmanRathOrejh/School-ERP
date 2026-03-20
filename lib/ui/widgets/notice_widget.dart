import 'package:flutter/material.dart';
import 'package:school_erp/ui/screens/noticebord_screen.dart';

class NoticeWidget extends StatelessWidget {
  final dynamic provider;
  final int index;
  final dynamic mainProvider;
  const NoticeWidget({
    super.key,
    required this.provider,
    required this.index,
    required this.mainProvider,
  });

  @override
  Widget build(BuildContext context) {
    var newprovider = provider[index];
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(width: 0.1, color: Color(0xffffffff)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoticBordScreen(
                        provider: provider,
                        index: index,
                        mainProvider: mainProvider,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      color: Color(0xffdeeef8),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.wallet_rounded,
                          size: 29,
                          color: Color(0xff5e99e7),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    newprovider?.title ?? "",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    newprovider?.description ?? "",
                    style: TextStyle(fontSize: 12, color: Color(0xff909090)),
                  ),
                ),
              ),
            ),

            Row(
              children: [
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: newprovider?.attachments != null
                      ? Icon(Icons.link, color: Color(0xff9c9c9c))
                      : SizedBox(height: 10),
                ),
                Expanded(
                  child: Text(
                    newprovider?.attachments?.length.toString() ?? "",
                    style: TextStyle(fontSize: 12, color: Color(0xff909090)),
                  ),
                ),
                Text(
                  mainProvider.formatDate(newprovider?.createdAt ?? ""),
                  style: TextStyle(fontSize: 12, color: Color(0xff909090)),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
