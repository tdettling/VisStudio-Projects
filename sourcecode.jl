using Gtk, Gtk.ShortNames

function sillyApp()

    # design GUI layout
    win = GtkWindow("TesterApp")

    # Adds elements vertically (layout option)
    vbox = GtkBox(:v)
    # Adding the above layout to the Window
    push!(win, vbox)

    # Adds a text-display area to our layout (Gtklabel)
    label = GtkLabel("ON")
    # Centering the label
    GAccessor.justify(label, Gtk.GConstants.GtkJustification.CENTER)
    # Adding label to our layout
    push!(vbox, label)

    # Adding button below text-display
    button = GtkButton("Click Me!")
    #Adding button to layout
    push!(vbox, button)

    # Adding button below text-display
    exitButton = GtkButton("EXIT")
    #Adding button to layout
    push!(vbox, exitButton)

    sc = Gtk.GAccessor.style_context(label)
    pr = CssProviderLeaf(data="#blue_text {color:blue;}")
    push!(sc, StyleProvider(pr), 600)
    set_gtk_property!(exitButton, :name, "blue_text")

    #Spaces out button/text-display
    #Tells Gtk to expand the label element in GtkBox layout
    set_gtk_property!(vbox, :expand, label, true)

    # Button callback
    id = signal_connect(button, "button-press-event") do widget, event
        if get_gtk_property(vbox[1], :label, String) == "ON"
            GAccessor.text(label, "OFF")
        else
            GAccessor.text(label, "ON")
        end
    end  

    signal_connect(exitButton, :clicked) do widget 
        Gtk.destroy(win) 
        println("Exit") 
    end


    #Shows all new additons to the GUI
    #Launch GUI
    showall(win)

    # Loop to keep Julia sesson running
# #    while true
#         println("(hit Enter to end)")
#         input = readline()
#         if input == ""
#             break
#         end
#     end
end

#FAKE MAIN
sillyApp()
