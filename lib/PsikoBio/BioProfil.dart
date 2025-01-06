import 'package:flutter/material.dart';

class CounselorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(
          'Konselor Anda',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade900, Colors.purple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nama Konselor',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tarif: Rp50.000',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Keahlian:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade900,
                      ),
                    ),
                    SizedBox(height: 10),
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3,
                      ),
                      children: [
                        _buildSkillChip('Karir'),
                        _buildSkillChip('Emosi'),
                        _buildSkillChip('Cinta'),
                        _buildSkillChip('Studi'),
                        _buildSkillChip('Kecemasan'),
                        _buildSkillChip('Motivasi'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Ulasan:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade900,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildReview('R, 22 Tahun', 'Konselor sangat responsif dan membantu!'),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Hubungi Konselor'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 223, 151, 254),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Center(
        child: Text(
          skill,
          style: TextStyle(color: Colors.purple.shade900, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildReview(String user, String review) {
    return Row(
      children: [
        Icon(Icons.person, color: Colors.purple.shade700, size: 30),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade900,
                ),
              ),
              SizedBox(height: 5),
              Text(
                review,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
