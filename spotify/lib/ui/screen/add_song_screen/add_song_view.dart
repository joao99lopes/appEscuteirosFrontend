import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:spotify/domain/util/validators.dart';

import 'add_song_controller.dart';

class AddSongView extends StatelessWidget {
  const AddSongView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: GetBuilder<AddSongController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.titleController,
                  validator: (String? value) => Validators.checkNotNull(value),
                  cursorHeight: screenHeight * 0.03,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: screenHeight * 0.7,
                  child: TextFormField(
                    controller: controller.lyricsController,
                    validator: (String? value) =>
                        Validators.checkNotNull(value),
                    cursorHeight: screenHeight * 0.03,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: "Lyrics",
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.addSong();
                      }
                    },
                    child: controller.waitingForServer.value
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          ),
                  ),
                ),
                Visibility(
                    visible: controller.serverError.value,
                    child: Text(
                      "An error ocurred",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
