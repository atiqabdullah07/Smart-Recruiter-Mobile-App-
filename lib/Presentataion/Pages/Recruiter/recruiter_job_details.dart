import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Jobs/recruiter_jobs_bloc.dart';

import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class RecruiterJobDetails extends StatelessWidget {
  const RecruiterJobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            title: 'Test',
            onPress: () {
              context.read<RecruiterJobsBloc>().add(GetApplicantsEvent());
            }),
      ),
    );
  }
}
