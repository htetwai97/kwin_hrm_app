import 'package:flutter/material.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/announcement_box_view.dart';

class AnnouncementListView extends StatelessWidget {
  const AnnouncementListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const CommonBoxView(
              textOne: "July 19",
              textTwo: "Ar Zar Ni day",
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 12,
        ),
      ),
    );
  }
}
