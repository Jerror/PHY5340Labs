function [stiffness] = NaCl_stiffness(r)
% NaCl interatomic stiffness (eV/angstrom^2) at separation r (angstrom)
stiffness = 10009 * exp(-r ./ 0.33) - 28.8 ./ r.^3;
end