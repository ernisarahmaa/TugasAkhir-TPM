import 'package:flutter/material.dart';
import 'package:tpmproject/api_data_source.dart';
import 'package:tpmproject/model/list_model.dart';
import 'package:tpmproject/pages/detail.dart';

class PageListCharacter extends StatefulWidget {
  const PageListCharacter({Key? key}) : super(key: key);

  @override
  State<PageListCharacter> createState() => _PageListCharacterState();
}

class _PageListCharacterState extends State<PageListCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Rick n Morty's Character"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadCharacter(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            RickMortyModel usersModel = RickMortyModel.fromJson(snapshot.data);
            return _buildSuccessSection(usersModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return const Text("ERROR");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(RickMortyModel data) {
    return ListView.builder(
      itemCount: data.results!.length,
      itemBuilder: (context, index) {
        return _buildItemUsers(data.results![index]);
      },
    );
  }

  Widget _buildItemUsers(Results characterData) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageDetailCharacter(
            idCharacter: characterData.id!,
            name: characterData.name!,
          )
        )
      ),
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 200,
              width: 300,
              child: Image.network(characterData.image!),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  characterData.name!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
