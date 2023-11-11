import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_app/constants/colors.dart';
import 'package:valorant_app/provider/agents_provider.dart';
import 'package:valorant_app/widgets/agents_info.dart';

class PopularAgents extends StatelessWidget {
  const PopularAgents({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgentsProvider>(context);
    provider.getData();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: provider.isLoading
          ? Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: getGridView(context),
            )
          : getGridView(context),
    );
  }

  Widget getGridView(BuildContext context) {
    return Consumer<AgentsProvider>(
      builder: (context, value, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount:
              value.agentModel?.data.length ?? 0, // Safely access the length
          itemBuilder: (context, index) => getAgentCard(context, index),
        );
      },
    );
  }

  Widget getAgentCard(BuildContext context, int index) {
    final provider = Provider.of<AgentsProvider>(context);

    if (provider.agentModel == null ||
        provider.agentModel!.data.length <= index) {
      return Expanded(
        child: Container(),
      ); // Return an empty container if data is not available
    }

    return Card(
      color: AppColors.darkPurple,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AgentInfo(agentIndex: index);
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: '${provider.agentModel!.data[index].bustPortrait}',
            ),
            Positioned(
              bottom: 25,
              left: 15,
              child: Text(
                provider.agentModel!.data[index].displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Rubik-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 15,
              child: Text(
                provider.agentModel!.data[index].role!.displayName.name
                    .toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Rubik-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
