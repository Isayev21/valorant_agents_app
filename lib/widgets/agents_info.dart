import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_app/constants/colors.dart';
import 'package:valorant_app/provider/agents_provider.dart';

class AgentInfo extends StatelessWidget {
  final int agentIndex;
  const AgentInfo({super.key, required this.agentIndex});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgentsProvider>(context);
    //data from http request
    provider.getData();
    // double screenWidth = MediaQuery.of(context).size.width;
    // double imageWidth = screenWidth * 0.8;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.background,
        title: const Text(
          'Agent Details',
          style: TextStyle(color: AppColors.mainTextColor),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.detailListBackground,
                height: 300,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          '${provider.agentModel!.data[agentIndex].background}',
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              opacity: 0.3,
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider
                                    .agentModel!.data[agentIndex].displayName
                                    .toUpperCase(),
                                style: const TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                provider.agentModel!.data[agentIndex].role!
                                    .displayName.name,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.mainTextColor,
                                    backgroundColor:
                                        AppColors.detailListBackground),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CachedNetworkImage(
                            imageUrl:
                                '${provider.agentModel!.data[agentIndex].bustPortrait}',
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              getTitleText('Biography'),
              const SizedBox(height: 5),
              getBiographyDescription(provider),
              const SizedBox(height: 15),
              getTitleText('Special Abilities'),
              const SizedBox(height: 15),
              getSpecialAbilities(provider: provider, abilityIndex: 0),
              getSpecialAbilities(provider: provider, abilityIndex: 1),
              getSpecialAbilities(provider: provider, abilityIndex: 2),
              getSpecialAbilities(provider: provider, abilityIndex: 3)
            ],
          ),
        ),
      ),
    );
  }

  Text getBiographyDescription(AgentsProvider provider) {
    return Text(
      provider.agentModel!.data[agentIndex].description,
      style: const TextStyle(
        color: AppColors.grey,
        letterSpacing: 2,
      ),
    );
  }

  Container getSpecialAbilities(
      {required AgentsProvider provider, required int abilityIndex}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.detailListBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            width: 70,
            imageUrl:
                '${provider.agentModel!.data[agentIndex].abilities[abilityIndex].displayIcon}',
          ),
          //Spacing between the image and text
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.agentModel!.data[agentIndex].abilities[abilityIndex]
                      .displayName,
                  style: const TextStyle(
                    color: AppColors.mainTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  provider.agentModel!.data[agentIndex].abilities[abilityIndex]
                      .description,
                  style: const TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: 15,
                    wordSpacing: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text getTitleText(String text) {
    return Text(
      '// ${text.toUpperCase()}',
      style: const TextStyle(
          color: AppColors.mainTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}
