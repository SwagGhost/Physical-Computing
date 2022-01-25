function setup
    COM_CloseNXT('all');
    close all;
    open = COM_OpenNXT ();
    COM_SetDefaultNXT(open);
end
