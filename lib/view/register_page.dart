import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static const IconData facebook =
      IconData(0xe255, fontFamily: 'MaterialIcons');
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300], // Background color or image
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Explore your options and choose your next home with confidence!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            _buildUI(context, 0.01)
          ],
        ),
      ),
    );
  }

  Widget _buildUI(context, double size) {
    return SizedBox(
      width: 500,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _header(context, 0.03),
              _formGroup(context),
              const Stack(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _login(),
          ),
        ],
      ),
    );
  }

  Widget _formGroup(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _inputField(context, "Username", 0.008, Icons.person, false),
          _gap(context, 0.008),
          _inputField(context, "Email", 0.008, Icons.mail, false),
          _gap(context, 0.008),
          _inputField(context, "Phone", 0.008, Icons.phone, false),
          _gap(context, 0.008),
          _inputField(context, "Password", 0.008, Icons.password, true),
          _gap(context, 0.008),
          _inputField(context, "Confirm Password", 0.008, Icons.password, true),
          _gap(context, 0.008),
          _loginButton(context),
          _gap(context, 0.008),
          _orText(),
          _gap(context, 0.008),
          _otherLoginRow(context),
        ],
      ),
    );
  }

  Widget _otherLoginRow(context) {
    return Row(
      children: [
        Expanded(
          child: _loginOther(context, "Facebook", facebook),
        ),
        Expanded(
          child: _loginGoogle(context, "Google"),
        ),
      ],
    );
  }

  Widget _orText() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
            width: 100,
            child: Center(
              child: Text(
                "OR",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 83, 83, 83),
                    fontWeight: FontWeight.bold),
              ),
            )),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget _header(context, double size) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width * size,
              fontWeight: FontWeight.bold),
        ),
        const Text("Enter your credential to login")
      ],
    );
  }

  Widget _inputField(context, String formName, double borderRadius,
      IconData icon, bool obscureText) {
    return TextField(
      decoration: InputDecoration(
          hintText: formName,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.sizeOf(context).width * borderRadius),
              borderSide: BorderSide.none),
          fillColor: const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
          filled: true,
          prefixIcon: Icon(icon),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 20)),
      obscureText: obscureText,
    );
  }

  Widget _loginOther(context, String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Get.offAllNamed('/detail');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQuery.sizeOf(context).width * 0.008,
            ),
          ),
          side: const BorderSide(
              color: Color.fromARGB(114, 33, 149, 243), width: 1),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 30,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Login With $name",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginGoogle(context, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Get.offAllNamed('/detail');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQuery.sizeOf(context).width * 0.008,
            ),
          ),
          side: const BorderSide(
              color: Color.fromARGB(114, 33, 149, 243), width: 1),
          padding: const EdgeInsets.symmetric(
            vertical: 25,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GoogleLogo(),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Login With $name",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAllNamed('/detail');
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MediaQuery.sizeOf(context).width * 0.008,
          ),
        ),
        backgroundColor: Colors.blue[300],
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
      ),
      child: const Text(
        "Sign Up",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _login() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Get.offAllNamed('/login');
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _gap(context, double size) {
    return SizedBox(height: MediaQuery.sizeOf(context).width * size);
  }
}

class GoogleLogo extends StatelessWidget {
  final double size;
  const GoogleLogo({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: CustomPaint(painter: GoogleLogoPainter(), size: Size.square(size)),
    );
  }
}

class GoogleLogoPainter extends CustomPainter {
  @override
  bool shouldRepaint(oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final length = size.width;
    final verticalOffset = (size.height / 2) - (length / 2);
    final bounds = Offset(0, verticalOffset) & Size.square(length);
    final center = bounds.center;
    final arcThickness = size.width / 4.5;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawArc(double startAngle, double sweepAngle, Color color) {
      final paint0 = paint..color = color;
      canvas.drawArc(bounds, startAngle, sweepAngle, false, paint0);
    }

    drawArc(3.5, 1.9, Colors.red);
    drawArc(2.5, 1.0, Colors.amber);
    drawArc(0.9, 1.6, Colors.green.shade600);
    drawArc(-0.18, 1.1, Colors.blue.shade600);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - (arcThickness / 2),
        bounds.centerRight.dx + (arcThickness / 2) - 4,
        bounds.centerRight.dy + (arcThickness / 2),
      ),
      paint
        ..color = Colors.blue.shade600
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }
}
