import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFD6220);
const Color textDark = Color(0xFF11120D);
const Color textGray = Color(0xFF888888);

class ConnectScreen extends StatefulWidget {
  final bool showAppBar;
  const ConnectScreen({super.key, this.showAppBar = true});
  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final suggestions = [
    {'name': 'Abdullah Al Sehab', 'sub': 'CSE, AUST', 'initial': 'A', 'isVerified': true},
    {'name': 'Sadnan Samim', 'sub': 'CSE, AUST', 'initial': 'S', 'isVerified': true},
    {'name': 'Maruf Hasan Tawhid', 'sub': 'CSE, AUST', 'initial': 'M', 'isVerified': true},
  ];

  @override
  void initState() { super.initState(); _tabController = TabController(length: 2, vsync: this); }
  @override
  void dispose() { _tabController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.showAppBar ? AppBar(
        backgroundColor: Colors.white, elevation: 0, surfaceTintColor: Colors.transparent, centerTitle: true,
        title: Text('Connect Friends', style: TextStyle(color: textDark, fontSize: 18, fontWeight: FontWeight.w700)),
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(color: Color(0xFFF5F5F5), shape: BoxShape.circle),
            child: IconButton(icon: Icon(Icons.arrow_back, color: primaryColor, size: 20), onPressed: () => Navigator.pop(context)),
          ),
        ),
      ) : null,
      body: Column(children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 46,
            decoration: BoxDecoration(color: Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8, offset: Offset(0, 3))]),
            child: TextField(
              decoration: InputDecoration(hintText: 'Find Friends', hintStyle: TextStyle(color: textGray, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: textGray, size: 20), border: InputBorder.none,
                  isCollapsed: true, contentPadding: EdgeInsets.symmetric(vertical: 14)),
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 48,
            decoration: BoxDecoration(color: Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(25)),
            child: TabBar(
              controller: _tabController, padding: EdgeInsets.all(4),
              indicator: BoxDecoration(color: Color(0xFFFFE0C2), borderRadius: BorderRadius.circular(10)),
              indicatorSize: TabBarIndicatorSize.tab, labelColor: textDark, unselectedLabelColor: textGray,
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5), dividerColor: Colors.transparent,
              tabs: [Tab(text: 'Your Connections'), Tab(text: 'Pending')],
            ),
          ),
        ),
        SizedBox(height: 4),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: suggestions.length,
              separatorBuilder: (_, __) => Divider(color: Colors.grey.shade100, height: 1, indent: 16, endIndent: 16),
              itemBuilder: (_, i) => _FriendTile(name: suggestions[i]['name'] as String, sub: suggestions[i]['sub'] as String, initial: suggestions[i]['initial'] as String, isVerified: suggestions[i]['isVerified'] as bool),
            ),
            Center(child: Text('Pending requests will appear here', style: TextStyle(color: textGray))),
          ]),
        ),
      ]),
    );
  }
}
class _FriendTile extends StatelessWidget {
  final String name, sub, initial;
  final bool isVerified;
  const _FriendTile({required this.name, required this.sub, required this.initial, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(children: [
        CircleAvatar(radius: 22, backgroundColor: primaryColor, child: Text(initial, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
        SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5, color: textDark)),
            if (isVerified) Padding(
              padding: EdgeInsets.only(left: 4),
              child: Container(width: 13, height: 13,
                  decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                  child: Center(child: Icon(Icons.check, color: Colors.white, size: 9))),
            ),
          ]),
          SizedBox(height: 2),
          Text(sub, style: TextStyle(fontSize: 12, color: textGray)),
        ])),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: Offset(0, 3))]),
          child: Row(children: [
            Icon(Icons.person_add_outlined, size: 15, color: textDark),
            SizedBox(width: 4),
            Text('Add', style: TextStyle(fontSize: 12.5, color: textDark, fontWeight: FontWeight.w600)),
          ]),
        ),
        SizedBox(width: 16),
        Icon(Icons.close, size: 16, color: textGray),
      ]),
    );
  }
}