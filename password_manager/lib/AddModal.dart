import 'package:flutter/material.dart';

import 'utils/constants.dart';

class AddModal extends StatelessWidget {
  const AddModal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: screenWidth * 0.4,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 156, 156, 156),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          searchText("Search for a website or app"),
          const SizedBox(
            height: 10,
          ),
          websiteContainer(context),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
            child: Text(
              "www.twitter.com",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Column(
            children: [
              formHeading("Username"),
              formTextField("Enter Username", Icons.person),
              formHeading("E-mail"),
              formTextField("Enter Email", Icons.email),
              formHeading("Password"),
              formTextField("Enter Password", Icons.lock_outline)
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: screenHeight * 0.065,
            width: screenWidth * 0.7,
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(5),
                    shadowColor:
                        MaterialStatePropertyAll(Constants.buttonBackground),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            side:
                                BorderSide(color: Constants.buttonBackground))),
                    backgroundColor:
                        MaterialStatePropertyAll(Constants.buttonBackground)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Ok Done",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget formTextField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(
                  20, 5, 5, 5), // add padding to adjust icon
              child: Icon(
                icon,
                color: Constants.searchGrey,
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Constants.searchGrey, fontWeight: FontWeight.w500),
            fillColor: const Color.fromARGB(247, 232, 235, 237),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(20))),
        style: const TextStyle(),
      ),
    );
  }

  Widget formHeading(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget websiteContainer(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 55,
          width: 120,
          decoration: BoxDecoration(
              color: Constants.logoBackground,
              borderRadius: BorderRadius.circular(20)),
          child: const FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Add",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 60,
              width: screenWidth * 0.6,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.websiteList.length,
                  itemBuilder: (context, index) =>
                      websiteBlock(Constants.websiteList[index])),
            ),
          ),
        ),
      ],
    );
  }

  Widget websiteBlock(String websiteString) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6.0, 3, 6, 3),
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
            color: Constants.logoBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.add),
            // SizedBox(
            //   width: 4,
            // ),
            Text(
              websiteString,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  Widget searchText(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(
                  20, 5, 5, 5), // add padding to adjust icon
              child: Icon(
                Icons.search,
                color: Constants.searchGrey,
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Constants.searchGrey, fontWeight: FontWeight.w500),
            fillColor: const Color.fromARGB(247, 232, 235, 237),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(20))),
        style: const TextStyle(),
      ),
    );
  }
}
