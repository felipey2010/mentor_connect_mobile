import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/models.dart';
import 'package:mentor_hub_mobile/views/widgets/useravatar_widget.dart';

class MyProfilePage extends StatefulWidget {
  final Profile profile;

  const MyProfilePage({super.key, required this.profile});

  @override
  // ignore: library_private_types_in_public_api
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _skillController;
  List<String> _skills = [];
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _usernameController = TextEditingController(text: widget.profile.username);
    _bioController = TextEditingController(text: widget.profile.bio);
    _skillController = TextEditingController();
    _skills = widget.profile.skills;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _skillController.dispose();
    super.dispose();
  }

  void _addSkill() {
    final skill = _skillController.text.trim();
    if (skill.isNotEmpty && !_skills.contains(skill)) {
      setState(() {
        _skills.add(skill);
        _skillController.clear();
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  // Save changes
                  _saveProfile();
                }
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: UserAvatar(
                imageUrl: widget.profile.image,
                name: widget.profile.name,
                radius: 50,
              ),
            ),
            SizedBox(height: 16),
            // Name
            Text('Nome', style: TextStyle(fontSize: 14, color: Colors.grey)),
            _isEditing
                ? TextField(controller: _nameController)
                : Text(widget.profile.name, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            // Username
            Text('Nome de usuário',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            _isEditing
                ? TextField(controller: _usernameController)
                : Text('@${widget.profile.username}',
                    style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            // Bio
            Text('Bio', style: TextStyle(fontSize: 14, color: Colors.grey)),
            _isEditing
                ? TextField(controller: _bioController, maxLines: 3)
                : Text(widget.profile.bio, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            // Skills
            Text('Habilidades',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            Wrap(
              spacing: 8.0,
              children: _skills
                  .map((skill) => Chip(
                        label: Text(skill),
                        onDeleted:
                            _isEditing ? () => _removeSkill(skill) : null,
                      ))
                  .toList(),
            ),
            _isEditing ? SizedBox(height: 8) : SizedBox.shrink(),
            _isEditing
                ? Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _skillController,
                          decoration: InputDecoration(
                            hintText: 'Add a skill',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _addSkill,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(height: 16),
            // Mentoring Preference
            Text('Preferência de Mentoria',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text(widget.profile.mentoringPreference,
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            // Joined Date
            Text('Membro desde',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text(
              '${widget.profile.joinedAt.year}-${widget.profile.joinedAt.month}-${widget.profile.joinedAt.day}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfile() {
    // Update the profile with new values
    final updatedProfile = Profile(
      id: widget.profile.id,
      name: _nameController.text,
      username: _usernameController.text,
      email: widget.profile.email,
      bio: _bioController.text,
      image: widget.profile.image,
      skills: widget.profile.skills,
      mentoringPreference: widget.profile.mentoringPreference,
      joinedAt: widget.profile.joinedAt,
    );

    // TODO: Save the updated profile to the backend or state management
    print('Profile Updated: $updatedProfile');
  }
}
