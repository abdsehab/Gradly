import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const primaryOrange = Color(0xFFFD6220);
  static const darkText = Color(0xFF2D2D2D);
  static const greyFill = Color(0xFFF4F5F7);

  @override
  Widget build(BuildContext context) {
    final String name = 'Naimul Islam';
    final String headline = 'Student at Ahsanullah University of Science and Technology';
    final String location = 'Dhaka, Bangladesh';
    final String connections = '500+';
    final String aboutText = 'Aspiring Software Engineer passionate about Flutter and data structures. Eager to learn and contribute in a dynamic professional environment. Looking for intern or full-time opportunities.';

    final List<Map<String, String>> experience = [
      {
        'title': 'Student',
        'company': 'Ahsanullah University of Science and Technology',
        'duration': 'Jan 2021 - Present • 5 yrs 2 mos',
        'location': 'Dhaka, Bangladesh',
      },
    ];

    final List<Map<String, String>> educationalHistory = [
      {
        'school': 'Ahsanullah University of Science and Technology',
        'degree': 'Bachelor of Science in Computer Science and Engineering',
        'duration': '2018 - 2022',
      },
    ];

    final List<String> skillsList = [
      'Flutter', 'Dart', 'Competitive Programming', 'Data Structures', 'Git', 'Agile'
    ];

    final List<Map<String, String>> posts = [
      {
        'time': '2 days ago',
        'content': 'Just completed a new Flutter project that implements complex animations! #Flutter #MobileDev #Dart',
        'likes': '124',
        'comments': '18',
      },
      {
        'time': '1 week ago',
        'content': 'Excited to announce I am looking for a Summer 2026 internship in Software Engineering. If your team is hiring, please reach out! #OpenToWork #SoftwareEngineering',
        'likes': '342',
        'comments': '45',
      },
      {
        'time': '3 weeks ago',
        'content': 'Finally mastered graph traversal algorithms for competitive programming. Feeling accomplished today! 💻📈',
        'likes': '89',
        'comments': '5',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: darkText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // cover and profile pic
            SizedBox(
              height: 200,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 140,
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.photo, color: Colors.grey)),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 16,
                    child: CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: greyFill,
                        child: const Icon(Icons.person, size: 60, color: Colors.grey),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.7),
                      child: const Icon(Icons.edit, color: darkText, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // main profile section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkText),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    headline,
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(connections, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryOrange)),
                      const SizedBox(width: 4),
                      const Text('connections', style: TextStyle(color: Colors.grey)),
                      const Spacer(),
                      Text(location, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      const SizedBox(width: 4),
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryOrange,
                            side: const BorderSide(color: primaryOrange),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: darkText)),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Divider(color: Colors.grey[200], thickness: 8),

            // about section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('About'),
                  const SizedBox(height: 12),
                  Text(aboutText, style: const TextStyle(color: darkText, fontSize: 15, height: 1.5)),
                ],
              ),
            ),
            Divider(color: Colors.grey[200], thickness: 8),

            // activity section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Activity'),
                  const SizedBox(height: 4),
                  Text(
                      '${posts.length} followers',
                      style: const TextStyle(color: primaryOrange, fontWeight: FontWeight.bold, fontSize: 14)
                  ),
                  const SizedBox(height: 16),

                  // activity label
                  const Text(
                      'Posts',
                      style: TextStyle(color: darkText, fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                  const SizedBox(height: 12),

                  // Feed of Post
                  for (final post in posts) _buildPostEntry(name, post),

                  // Show all post button
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Show all posts', style: TextStyle(color: primaryOrange, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[200], thickness: 8),

            // Experience Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Experience'),
                  const SizedBox(height: 16),
                  for (final job in experience) _buildJobEntry(job),
                ],
              ),
            ),
            Divider(color: Colors.grey[200], thickness: 8),

            // Education Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Education'),
                  const SizedBox(height: 16),
                  for (final edu in educationalHistory) _buildEducationEntry(edu),
                ],
              ),
            ),
            Divider(color: Colors.grey[200], thickness: 8),

            // Skills Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Skills'),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final skill in skillsList)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: primaryOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(skill, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: darkText)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined, color: Colors.grey, size: 20)),
      ],
    );
  }

  Widget _buildPostEntry(String userName, Map<String, String> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: greyFill,
              child: const Icon(Icons.person, size: 20, color: Colors.grey),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText)),
                      const Text(' posted this • ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                      Text(post['time']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(post['content']!, style: const TextStyle(color: darkText, fontSize: 14, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(post['likes']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
            const SizedBox(width: 24),
            Row(
              children: [
                const Icon(Icons.chat_bubble_outline, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(post['comments']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Divider(color: Colors.grey[200], thickness: 1),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildJobEntry(Map<String, String> job) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: greyFill, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.business_center_outlined, color: primaryOrange, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job['title']!, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText, fontSize: 16)),
                const SizedBox(height: 2),
                Text(job['company']!, style: const TextStyle(color: darkText, fontSize: 14)),
                const SizedBox(height: 2),
                Text(job['duration']!, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 2),
                Text(job['location']!, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationEntry(Map<String, String> edu) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: greyFill, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.school_outlined, color: primaryOrange, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(edu['degree']!, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText, fontSize: 16)),
                const SizedBox(height: 2),
                Text(edu['school']!, style: const TextStyle(color: darkText, fontSize: 14)),
                const SizedBox(height: 2),
                Text(edu['duration']!, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}