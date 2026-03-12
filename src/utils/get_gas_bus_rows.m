function gasBusRows = get_gas_bus_rows(mpc, gasBusIds, fieldName)
gasBusIds = gasBusIds(:);
[isPresent, gasBusRows] = ismember(gasBusIds, mpc.Gbus(:,1));

if any(~isPresent)
    error('Field "%s" references undefined gas bus id(s): %s', fieldName, mat2str(gasBusIds(~isPresent)'));
end
end
