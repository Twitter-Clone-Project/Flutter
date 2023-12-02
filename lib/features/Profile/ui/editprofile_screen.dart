import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';


class EditProfileScreen extends StatefulHookConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});
    _tabcontroller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);


    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;
    final FormatNumber =
        NumberFormat
            .compact(locale: context.locale.toString())
            .format;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Edit Profile", style: TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              // Add save logic here
            },
            style: TextButton.styleFrom(
              primary: Colors.white, // Set text color
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust padding as needed
            ),
            child: Text("Save", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
      SliverAppBar(
      expandedHeight: backgroundImageHeight + profileImageDiameter / 2,
        floating: false,
        pinned: false,
        stretch: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: profileImageDiameter / 2,
              child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0, // Adjust the border width as needed
                        ),
                      ),
                      child: CircleAvatar(
                        radius: profileImageDiameter / 2,
                        backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
        ],
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  // Add controller and other properties as needed
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bio'),
                  // Add controller and other properties as needed
                ),


                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                  // Add controller and other properties as needed
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Website'),
                  // Add controller and other properties as needed
                ),
              ],
            ),
          ),
        ]),
      )
      ],
    ),);
  }
}
