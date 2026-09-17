
# Slot Complex Permeance

A MATLAB implementation for calculating the **complex relative permeance of a slotted air gap** using Schwarz–Christoffel mapping and analytic continuation.

The main calculation is encapsulated in the `SlotComplexPermeance` class. A separate demo script is provided to demonstrate parameter definition, class usage, and result visualization.

## Files

```text
SlotComplexPermeance.m
demo_slot_complex_permeance.m
README.md
```

* `SlotComplexPermeance.m` — Main calculation class.
* `demo_slot_complex_permeance.m` — Example showing how to use the class and plot the results.
* `README.md` — Usage documentation.

## Basic Usage

Create a `SlotComplexPermeance` object using four geometric parameters:

```matlab
Rs = 130e-3;
Rm = 131.2e-3;
b0 = 3.6e-3;
Qa = 120;

model = SlotComplexPermeance(Rs, Rm, b0, Qa);
```

The input parameters are:

| Parameter | Description                                     | Unit |
| --------- | ----------------------------------------------- | ---- |
| `Rs`    | Stator inner radius                             | m    |
| `Rm`    | Radius of the evaluation surface in the air gap | m    |
| `b0`    | Slot opening width                              | m    |
| `Qa`    | Number of slots                                 | -    |

Run the calculation using:

```matlab
result = model.calculate();
```

## Output

The `calculate()` method returns a structure containing the calculated complex relative permeance:

```matlab
result.theta
result.theta_deg
result.lambda
result.lambda_a
result.lambda_b
result.lambda_mag
```

where:

| Output         | Description                                      |
| -------------- | ------------------------------------------------ |
| `theta`      | Angular position in radians                      |
| `theta_deg`  | Angular position in degrees                      |
| `lambda`     | Complex relative permeance                       |
| `lambda_a`   | Real part of the complex relative permeance      |
| `lambda_b`   | Imaginary part of the complex relative permeance |
| `lambda_mag` | Magnitude of the complex relative permeance      |

For example:

```matlab
lambda_real = result.lambda_a;
lambda_imag = result.lambda_b;
lambda_magnitude = result.lambda_mag;
```

## Complete Example

A minimal example is:

```matlab
clear;
clc;
close all;

Rs = 130e-3;
Rm = 131.2e-3;
b0 = 3.6e-3;
Qa = 120;

model = SlotComplexPermeance(Rs, Rm, b0, Qa);
result = model.calculate();

figure;

plot(result.theta_deg, result.lambda_a);
grid on;

xlabel('\theta (deg)');
ylabel('\lambda_a');
title('Real Part of Complex Relative Permeance');
```

## Demo

The repository includes:

```text
demo_slot_complex_permeance.m
```

Run the demo directly in MATLAB:

```matlab
demo_slot_complex_permeance
```

The demo calculates the complex relative permeance and plots:

1. Real part, `lambda_a`
2. Imaginary part, `lambda_b`
3. Magnitude, `|lambda|`

This keeps the numerical calculation inside `SlotComplexPermeance` and separates visualization and parameter definition from the calculation class.

## Reference

The implementation is based on the analytical formulation of slotted air-gap complex relative permeance using Schwarz–Christoffel mapping. The original method is described in:
DOI: `10.1049/iet-epa.2016.0712`
