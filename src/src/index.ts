import assert from "assert";
import rule from "./rule";
import * as typedAst from "@r2c/typed-ast-util";

async function main() {
  const inputDir = process.argv[2];
  assert(inputDir, "must supply directory of ASTs as input directory");
  const results = await typedAst.checkAllASTs([rule], inputDir);
  process.stdout.write(
    JSON.stringify(
      {
        results
      },
      null,
      2
    )
  );
}

if (require.main == module) {
  main().catch(err => {
    console.error("Failure", err);
    process.exit(1);
  });
}
