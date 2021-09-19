data = [
    [2, 09.8, 2019], #ES101
    [4, 07.5, 2019], #F 128
    [6, 08.8, 2019], #MA111
    [4, 08.5, 2019], #MA141
    [2, 05.0, 2019], #QG111
    [2, 08.3, 2019], #QG122
    [4, 07.2, 2019], #EM104
    [4, 07.4, 2019], #F 328
    [6, 09.8, 2019], #MA211
    [6, 09.4, 2019], #MC102
    [2, 09.5, 2020], #CE304
    [4, 10.0, 2020], #EA513
    [2, 08.8, 2020], #ES242
    # [2, 07.1, 2020], #F 129--
    [6, 09.0, 2020], #MA311
    [6, 10.0, 2020], #MC202
    # [4, 05.1, 2020], #EM360--
    # [4, 06.7, 2020], #EM461--
    [4, 10.0, 2020], #MC322
    [4, 09.0, 2020], #MS211
    [2, 08.8, 2021], #BE310
    [4, 09.1, 2021], #EE532
    [4, 08.5, 2021], #EM335
    # [4, 07.7, 2021], #EM404--
    [4, 08.7, 2021], #MC404
    [4, 10.0, 2021]  #ME414
]

total_score = 0
total_hours = 0
years = []

for entry in data:
    if entry[2] not in years:
        years.append(entry[2])

    total_score += entry[0]*entry[1]/10
    total_hours += entry[0]

gpa_cumulative = total_score/total_hours


years_gpa = []
total_score = 0
total_hours = 0

for year in years:
    total_score = 0
    total_hours = 0

    for entry in data:
        if entry[2] == year:
            total_score += entry[0]*entry[1]/10
            total_hours += entry[0]

    years_gpa.append(total_score/total_hours)


gpa_siga = 0.8907



print(
    "GPA SIGA:       {:>10.4}\n".format(gpa_siga) + 
    "GPA Cumulative: {:>10.4}\n".format(gpa_cumulative) + 
    "GPA {}:       {:>10.4}\n".format(years[0], years_gpa[0]) + 
    "GPA {}:       {:>10.4}\n".format(years[1], years_gpa[1]) + 
    "GPA {}:       {:>10.4}\n".format(years[2], years_gpa[2]))