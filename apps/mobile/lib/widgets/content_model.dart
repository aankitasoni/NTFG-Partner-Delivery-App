class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
  description:
      'Get what you need in just\n a matter of minutes!',
  image: "assets/fast_delivery.png",
  title: 'Superfast Delivery',
),
OnboardingContent(
  description:
      'Stock up big with bulk orders\n and enjoy amazing discounts',
  image: "assets/bulk_saving.jpg",
  title: 'Bulk Savings',
),

OnboardingContent(
  description:
      'Pay securely & shop worry-free\n with hassle-free returns',
  image: "assets/secure_payment.jpg",
  title: 'Safe & Easy',
),
];