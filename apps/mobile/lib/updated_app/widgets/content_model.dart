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
        'Share notes, assignments, and\n       presentations instantly',
    image: "assets/sharing.png",
    title: 'Seamless Sharing',
  ),
  OnboardingContent(
    description:
        'Collaborate with peers on projects and\n         enhance learning together',
    image: "assets/learning.png",
    title: 'Collaborative Learning',
  ),
  OnboardingContent(
    description: 'Take fun, quick quizzes to\n     challenge your mind',
    image: "assets/quiz_fun.png",
    title: 'Quiz & Fun!',
  ),
];