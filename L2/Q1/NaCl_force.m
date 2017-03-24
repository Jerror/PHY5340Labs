function [force] = NaCl_force(r)
% NaCl interatomic force (in eV/angstrom) at separation r (in angstrom)
force = 14.4 ./ r.^2 - 3303 * exp(-r ./ 0.33);
end