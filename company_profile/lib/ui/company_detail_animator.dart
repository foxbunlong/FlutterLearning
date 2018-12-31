import 'package:company_profile/repo/repo.dart';
import 'package:company_profile/ui/company_detail_page.dart';
import 'package:flutter/material.dart';

class CompanyDetailAnimator extends StatefulWidget {
  @override
  _CompanyDetailAnimatorState createState() => _CompanyDetailAnimatorState();
}

class _CompanyDetailAnimatorState extends State<CompanyDetailAnimator> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1780),
        vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDetailPage(company: RepoData.longCompany, controller: _controller,);
  }
}
