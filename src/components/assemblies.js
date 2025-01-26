import * as Plot from "npm:@observablehq/plot";
import * as Inputs from "npm:@observablehq/inputs";
import { html } from "npm:htl";

export function assemblies_by_year(data, { width = 800, height = 400 } = {}) {
  return Plot.plot({
    marks: [
      Plot.line(data, {
        x: "year",
        y: "count",
      }),
      Plot.dot(data, {
        x: "year",
        y: "count",
      }),
    ],
    grid: true,
    y: {
      label: "Number of Assemblies",
    },
    x: {
      label: "Year",
    },
  });
}
