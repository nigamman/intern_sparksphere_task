import 'package:flutter/material.dart';
import '../widgets/chart_widget.dart';
import '../utils/box_decoration_helper.dart';

class CustomerStats extends StatelessWidget {
  const CustomerStats({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    List<double> customerData = [4000, 2500, 4500, 3000, 3500, 6000];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecorationHelper.getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Customer Stats",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 200,
              child: ChartWidget(
                yValues: customerData,
                xLabels: months,
                showAxes: true,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}