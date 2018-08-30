string=$(git log -1 --pretty=%B)
if [[ $string = *"WIP"* ]]; then
  echo "It's there!"
fi