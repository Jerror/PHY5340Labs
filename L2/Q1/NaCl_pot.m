function [pot] = NaCl_pot(r)
% NaCl interatomic potential (in eV) at separation r (in angstrom)
pot = 1090 * exp(-r ./ 0.33) - 14.4 ./ r;
end