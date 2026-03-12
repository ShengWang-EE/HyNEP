function gasComposition = get_reference_gas_composition(sourceCompositions)
sourceCompositions = double(sourceCompositions);

finiteMask = isfinite(sourceCompositions);
if ~any(finiteMask(:))
    error('gasCompositionForGasSource does not contain any finite values.');
end

sourceCompositions(~finiteMask) = 0;
counts = sum(finiteMask, 1);
counts(counts == 0) = 1;

gasComposition = sum(sourceCompositions, 1) ./ counts;
total = sum(gasComposition);

if ~isfinite(total) || total <= 0
    error('Failed to build a valid reference gas composition.');
end

gasComposition = gasComposition / total;
end
