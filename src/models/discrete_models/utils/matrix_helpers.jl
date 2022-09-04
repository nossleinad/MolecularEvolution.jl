#BM: To-do - Migrate some code from the general "util" into this.

#This just returns a Q matrix.
function HKY85(TrTv,pA,pC,pG,pT)
    unscaledHKY85 = [pA pC pG*TrTv pT; pA pC pG pT*TrTv; pA*TrTv pC pG pT; pA pC*TrTv pG pT]
    for i in 1:4
        unscaledHKY85[i,i]=0
        unscaledHKY85[i,i]=-sum(unscaledHKY85[i,:])
    end
    return unscaledHKY85 ./-(unscaledHKY85[1,1]+unscaledHKY85[2,2]+unscaledHKY85[3,3]+unscaledHKY85[4,4])
end

const WAGmatrix = [-60.1926 3.26324 2.34804 5.02923 0.668808 4.50138 1.00707 0.614288 2.8795 1.26431 2.83893 1.61995 4.57074 2.88691 1.75252 10.7101 6.73946 6.37375 0.35946 0.764894; 3.26324 -26.1705 0.0962568 0.0678423 1.26464 0.974403 0.791065 0.540574 0.23523 1.22101 1.24069 0.842805 0.347612 0.313977 1.67824 4.4726 1.62992 3.18413 2.27837 1.72794; 2.34804 0.0962568 -57.72 19.6173 0.148478 2.75024 2.95706 0.125304 1.52466 0.269452 0.32966 17.251 1.34714 1.95972 0.468033 3.40533 1.19107 0.484018 0.412312 1.03489; 5.02923 0.0678423 19.6173 -70.4919 0.257789 1.80382 1.81116 0.404776 8.21158 0.490144 1.00125 3.00956 2.16806 17.3783 1.39535 2.23982 2.61419 1.87059 0.497433 0.623719; 0.668808 1.26464 0.148478 0.257789 -49.9847 0.158647 2.15858 3.36628 0.282261 6.72059 3.78302 0.305538 0.51296 0.317481 0.326346 1.7346 0.546192 2.06492 4.86017 20.5074; 4.50138 0.974403 2.75024 1.80382 0.158647 -27.2449 0.792457 0.0967499 1.18692 0.194782 0.553173 3.57627 0.773901 1.04868 1.85767 4.2634 0.717545 0.594945 1.07071 0.329184; 1.00707 0.791065 2.95706 1.81116 2.15858 0.792457 -68.2465 0.439075 2.82919 1.58695 1.28409 12.5704 2.21205 13.6438 6.79042 2.35176 1.50385 0.376062 0.834267 12.3072; 0.614288 0.540574 0.125304 0.404776 3.36628 0.0967499 0.439075 -65.762 1.02892 10.0752 13.5273 1.76099 0.317506 0.361952 0.594093 1.01497 4.63305 24.8508 0.675128 1.33502; 2.8795 0.23523 1.52466 8.21158 0.282261 1.18692 2.82919 1.02892 -71.9938 0.818336 2.9685 9.57014 1.76944 12.3754 17.0032 3.07289 4.40689 0.970464 0.436898 0.423423; 1.26431 1.22101 0.269452 0.490144 6.72059 0.194782 1.58695 10.0752 0.818336 -55.3805 15.4228 0.417907 1.32127 2.76265 1.58126 1.09535 1.03778 5.72027 2.1139 1.26654; 2.83893 1.24069 0.32966 1.00125 3.78302 0.553173 1.28409 13.5273 2.9685 15.4228 -67.1308 0.629813 0.544368 4.9098 2.17063 1.5693 4.81721 6.54037 1.63857 1.36128; 1.61995 0.842805 17.251 3.00956 0.305538 3.57627 12.5704 1.76099 9.57014 0.417907 0.629813 -82.4777 0.619836 4.90465 2.0187 12.6274 6.45016 0.623538 0.228503 3.45058; 4.57074 0.347612 1.34714 2.16806 0.51296 0.773901 2.21205 0.317506 1.76944 1.32127 0.544368 0.619836 -31.4125 2.96563 2.15896 5.12592 2.52719 1.0005 0.442935 0.686449; 2.88691 0.313977 1.95972 17.3783 0.317481 1.04868 13.6438 0.361952 12.3754 2.76265 4.9098 4.90465 2.96563 -83.8349 9.64477 3.26906 2.72592 0.957268 0.685467 0.723509; 1.75252 1.67824 0.468033 1.39535 0.326346 1.85767 6.79042 0.594093 17.0032 1.58126 2.17063 2.0187 2.15896 9.64477 -60.802 3.88965 1.76155 0.800207 3.69815 1.21225; 10.7101 4.4726 3.40533 2.23982 1.7346 4.2634 2.35176 1.01497 3.07289 1.09535 1.5693 12.6274 5.12592 3.26906 3.88965 -79.6567 13.9104 0.739488 1.6641 2.50053; 6.73946 1.62992 1.19107 2.61419 0.546192 0.717545 1.50385 4.63305 4.40689 1.03778 4.81721 6.45016 2.52719 2.72592 1.76155 13.9104 -62.9006 4.41086 0.352251 0.925072; 6.37375 3.18413 0.484018 1.87059 2.06492 0.594945 0.376062 24.8508 0.970464 5.72027 6.54037 0.623538 1.0005 0.957268 0.800207 0.739488 4.41086 -63.7231 1.1609 1.0; 0.35946 2.27837 0.412312 0.497433 4.86017 1.07071 0.834267 0.675128 0.436898 2.1139 1.63857 0.228503 0.442935 0.685467 3.69815 1.6641 0.352251 1.1609 -31.3064 7.8969; 0.764894 1.72794 1.03489 0.623719 20.5074 0.329184 12.3072 1.33502 0.423423 1.26654 1.36128 3.45058 0.686449 0.723509 1.21225 2.50053 0.925072 1.0 7.8969 -60.0768]

const LGmatrix = [-68.2197 7.90863 1.2555 3.2998 0.806091 6.56448 1.14021 0.476059 1.70469 1.25611 3.57143 0.879541 3.74178 3.08167 1.35066 15.0198 6.79789 8.09541 0.574197 0.695704; 7.90863 -49.6876 0.198761 0.011117 3.51174 1.80874 2.03521 1.01874 0.04215 1.88735 2.83951 1.68007 0.239513 0.269463 1.69844 8.84719 3.63321 6.2253 2.12921 3.70328; 1.2555 0.198761 -50.241 16.6615 0.055336 2.6846 2.94574 0.033966 0.899053 0.047901 0.081174 16.1286 1.25331 1.66297 0.393842 3.94076 1.3531 0.120634 0.09497 0.429279; 3.2998 0.011117 16.6615 -51.7441 0.059769 1.1084 1.34681 0.140644 5.74199 0.221374 0.552013 1.7212 1.3326 13.1179 1.15645 1.94444 1.92084 0.778553 0.247361 0.381397; 0.806091 3.51174 0.055336 0.059769 -61.6725 0.284644 2.16738 3.5355 0.075995 8.23783 5.71554 0.28445 0.300143 0.113923 0.167515 1.14962 0.524262 2.08014 7.80707 24.7955; 6.56448 1.80874 2.6846 1.1084 0.284644 -29.4911 0.989686 0.027659 0.942509 0.140632 0.443358 4.56787 0.625809 0.851393 1.23977 5.52851 0.412531 0.243704 0.853083 0.173733; 1.14021 2.03521 2.94574 1.34681 2.16738 0.989686 -78.8432 0.345954 2.21543 1.16391 1.40588 14.3273 1.61678 15.2941 7.7101 3.14559 1.85639 0.378143 1.89704 16.8615; 0.476059 1.01874 0.033966 0.140644 3.5355 0.027659 0.345954 -40.9692 0.505414 13.1702 13.5786 0.608467 0.248724 0.231481 0.403492 0.203682 3.28452 2.06242 0.35478 0.738801; 1.70469 0.04215 0.899053 5.74199 0.075995 0.942509 2.21543 0.505414 -60.2397 0.436882 2.08624 6.81561 1.24018 10.2764 20.1 2.37881 3.61218 0.588447 0.158568 0.419191; 1.25611 1.88735 0.047901 0.221374 8.23783 0.140632 1.16391 13.1702 0.436882 -60.3099 20.0564 0.217415 0.791345 1.85066 0.959069 0.579185 0.962526 5.41017 1.96877 0.952079; 3.57143 2.83951 0.081174 0.552013 5.71554 0.443358 1.40588 13.5786 2.08624 20.0564 -75.9747 1.1788 0.317253 5.3143 1.53825 1.10241 6.41936 6.03285 2.21197 1.52927; 0.879541 1.68007 16.1286 1.7212 0.28445 4.56787 14.3273 0.608467 6.81561 0.217415 1.1788 -78.1476 0.51405 5.38796 2.38896 12.7359 6.35681 0.265904 0.144174 1.9446; 3.74178 0.239513 1.25331 1.3326 0.300143 0.625809 1.61678 0.248724 1.24018 0.791345 0.317253 0.51405 -22.8581 1.98358 1.05657 4.25168 1.81574 0.94208 0.302262 0.28473; 3.08167 0.269463 1.66297 13.1179 0.113923 0.851393 15.2941 0.231481 10.2764 1.85066 5.3143 5.38796 1.98358 -77.9142 8.92164 3.8885 3.43194 0.668293 0.750481 0.81764; 1.35066 1.69844 0.393842 1.15645 0.167515 1.23977 7.7101 0.403492 20.1 0.959069 1.53825 2.38896 1.05657 8.92164 -57.0791 2.72662 1.83963 0.542964 1.88608 0.999078; 15.0198 8.84719 3.94076 1.94444 1.14962 5.52851 3.14559 0.203682 2.37881 0.579185 1.10241 12.7359 4.25168 3.8885 2.72662 -90.3831 20.5645 0.31255 0.790716 1.27267; 6.79789 3.63321 1.3531 1.92084 0.524262 0.412531 1.85639 3.28452 3.61218 0.962526 6.41936 6.35681 1.81574 3.43194 1.83963 20.5645 -72.9665 6.95249 0.447447 0.781117; 8.09541 6.2253 0.120634 0.778553 2.08014 0.243704 0.378143 2.06242 0.588447 5.41017 6.03285 0.265904 0.94208 0.668293 0.542964 0.31255 6.95249 -43.0943 0.602135 0.792149; 0.574197 2.12921 0.09497 0.247361 7.80707 0.853083 1.89704 0.35478 0.158568 1.96877 2.21197 0.144174 0.302262 0.750481 1.88608 0.790716 0.447447 0.602135 -33.2347 10.0143; 0.695704 3.70328 0.429279 0.381397 24.7955 0.173733 16.8615 0.738801 0.419191 0.952079 1.52927 1.9446 0.28473 0.81764 0.999078 1.27267 0.781117 0.792149 10.0143 -67.5861]

const JTTmatrix = [-67.6807 1.8253 2.62906 3.38919 0.439402 5.52905 0.698916 1.14919 1.17382 0.984993 1.49142 1.77284 6.22628 1.7689 1.68931 12.3506 14.5603 9.29101 0.267941 0.443212; 1.8253 -36.4462 0.335605 0.17128 2.15529 1.73606 2.30355 0.478375 0.155718 0.522966 1.30017 0.995491 0.392886 0.290103 3.24037 6.84819 1.49278 1.97415 3.50834 6.71957; 2.62906 0.335605 -63.169 24.6769 0.103333 4.04294 3.28009 0.368468 0.897486 0.195361 0.603695 17.6327 0.404041 1.65744 0.492165 1.8723 1.35087 1.00169 0.182588 1.44235; 3.38919 0.17128 24.6769 -57.8268 0.139259 3.54473 0.77453 0.355139 5.50212 0.309742 0.556299 1.83686 0.610027 10.8592 1.01192 0.992752 1.05355 1.47832 0.363426 0.201608; 0.439402 2.15529 0.103333 0.139259 -41.8332 0.15954 1.44069 2.46907 0.077911 7.94425 1.38589 0.233473 0.471779 0.14515 0.207524 2.9993 0.441343 1.88567 1.70915 17.4252; 5.52905 1.73606 4.04294 3.54473 0.15954 -35.8413 0.640854 0.170842 0.85737 0.220799 0.414257 2.45707 0.661141 0.734896 4.32006 5.95525 1.00677 1.49379 1.72904 0.16681; 0.698916 2.30355 3.28009 0.77453 1.44069 0.640854 -82.0863 0.5776 1.6684 1.71757 1.04744 12.7912 3.62838 18.0602 10.2013 2.36221 1.51671 0.387084 0.407311 18.5823; 1.14919 0.478375 0.368468 0.355139 2.46907 0.170842 0.5776 -72.951 0.643605 7.4195 15.3518 1.56008 0.313221 0.248689 0.76 1.2872 8.11427 30.2924 0.427382 0.964144; 1.17382 0.155718 0.897486 5.50212 0.077911 0.85737 1.6684 0.643605 -57.8551 0.465418 1.9845 8.0371 0.687399 9.42627 20.7456 1.50757 3.06816 0.394198 0.283208 0.2793; 0.984993 0.522966 0.195361 0.309742 7.94425 0.220799 1.71757 7.4195 0.465418 -50.0727 12.2546 0.436212 3.36957 2.25274 1.18279 1.8826 0.865866 5.59666 1.68501 0.766034; 1.49142 1.30017 0.603695 0.556299 1.38589 0.414257 1.04744 15.3518 1.9845 12.2546 -59.3078 1.0508 0.521765 1.45172 1.36957 0.90733 6.71918 9.65441 0.639704 0.603279; 1.77284 0.995491 17.6327 1.83686 0.233473 2.45707 12.7912 1.56008 8.0371 0.436212 1.0508 -79.4457 0.387011 2.44284 1.43328 16.0708 7.47088 0.522749 0.088012 2.22633; 6.22628 0.392886 0.404041 0.610027 0.471779 0.661141 3.62838 0.313221 0.687399 3.36957 0.521765 0.387011 -38.896 5.10954 2.25746 8.85967 3.73959 0.672198 0.222302 0.361739; 1.7689 0.290103 1.65744 10.8592 0.14515 0.734896 18.0602 0.248689 9.42627 2.25274 1.45172 2.44284 5.10954 -69.3853 9.60186 1.74374 1.66436 0.571191 0.547155 0.809408; 1.68931 3.24037 0.492165 1.01192 0.207524 4.32006 10.2013 0.76 20.7456 1.18279 1.36957 1.43328 2.25746 9.60186 -69.0537 3.18225 2.06616 0.546484 3.99695 0.748581; 12.3506 6.84819 1.8723 0.992752 2.9993 5.95525 2.36221 1.2872 1.50757 1.8826 0.90733 16.0708 8.85967 1.74374 3.18225 -88.2851 15.1801 1.29804 0.987916 1.99729; 14.5603 1.49278 1.35087 1.05355 0.441343 1.00677 1.51671 8.11427 3.06816 0.865866 6.71918 7.47088 3.73959 1.66436 2.06616 15.1801 -74.8406 3.6348 0.255953 0.638941; 9.29101 1.97415 1.00169 1.47832 1.88567 1.49379 0.387084 30.2924 0.394198 5.59666 9.65441 0.522749 0.672198 0.571191 0.546484 1.29804 3.6348 -71.9822 0.761595 0.525762; 0.267941 3.50834 0.182588 0.363426 1.70915 1.72904 0.407311 0.427382 0.283208 1.68501 0.639704 0.088012 0.222302 0.547155 3.99695 0.987916 0.255953 0.761595 -20.4393 2.37629; 0.443212 6.71957 1.44235 0.201608 17.4252 0.16681 18.5823 0.964144 0.2793 0.766034 0.603279 2.22633 0.361739 0.809408 0.748581 1.99729 0.638941 0.525762 2.37629 -57.2781]