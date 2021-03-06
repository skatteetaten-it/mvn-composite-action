const core = require("@actions/core");
const github = require("@actions/github");

function findMatch(ref, searchParam) {
  let match = ref.match(searchParam);
  return match.length == 0 ? null : match[1];
}

function run() {
  let ref = github.context.ref;
  const type = core.getInput("type", { required: true });
  let version;
  if (type == "release") {
    version = findMatch(ref, "refs/tags/(.*)");
  } else if (type == "branch") {
    version = findMatch(ref, "refs/heads/(.*)");
  } else {
    core.setFailed("Invalid type: " + type + " (type is: branch, release)");
    return;
  }

  if (!version) {
    core.setFailed("Could not find version: " + type + " (ref: " + ref + ")");
  }
  version = version.replace(/\//g, "_");
  console.log(`Version is: ${version}`);

  core.setOutput(
    "version",
    type == "branch" ? version + "-" + github.context.runNumber : version
  );
  core.setOutput(
    "mvnversion",
    type == "branch" ? version + "-SNAPSHOT" : version
  );
}

try {
  run();
} catch (error) {
  core.setFailed(error.message);
}
