String timeGenerate() => DateTime
  .now()
  .toLocal()
  .toString()
  .replaceAll(' ', '_')
  .replaceAll(':', '-');