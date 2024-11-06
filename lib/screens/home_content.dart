import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/grid_view_section.dart';
import '../widget/list_view_section.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 0 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 0 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E1A), // Dark background for galaxy theme
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: const Color(0xFF0B0E1A), // Dark background for galaxy theme
          child: Column(
            children: [
              _buildHeader(),
              const GridViewSection(),
              const SizedBox(height: 25),
              const ListViewSection(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          color: _isScrolled ? const Color(0xFF1C2033) : const Color(0xFF0B0E1A),
          boxShadow: _isScrolled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 0,
          titleSpacing: 0,
          title: _buildAppBarContent(),
        ),
      ),
    );
  }

  Widget _buildAppBarContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            context,
            Icons.account_circle_sharp,
            size: 27,
            onPressed: () {
              // Handle profile icon press
            },
          ),
          Row(
            children: [
              _buildIconButton(
                context,
                Icons.notifications_outlined,
                size: 24,
                onPressed: () {
                  // Handle notifications icon press
                },
              ),
              const SizedBox(width: 16),
              _buildIconButton(
                context,
                Icons.settings_outlined,
                size: 24,
                onPressed: () {
                  // Handle settings icon press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Hazim althaf',
              style: GoogleFonts.orbitron(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context, 
    IconData icon, 
    {required double size, required VoidCallback onPressed}
  ) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Icon(
            icon,
            size: size,
            color: const Color.fromARGB(255, 165, 154, 6), // Updated icon color for galaxy theme
          ),
        ),
      ),
    );
  }
}