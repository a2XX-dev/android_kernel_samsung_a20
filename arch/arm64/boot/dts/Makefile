# SPDX-License-Identifier: GPL-2.0
dtb-y += exynos/dtbo/exynos7885.dtb
dtbo-y += exynos/dtbo/exynos7904-a20_usa_single_00.dtbo
dtbo-y += exynos/dtbo/exynos7904-a20_usa_single_01.dtbo
dtbo-y += exynos/dtbo/exynos7904-a20_usa_single_03.dtbo
dtbo-y += exynos/dtbo/exynos7904-a20_usa_single_04.dtbo
dtbo-y += exynos/dtbo/exynos7904-a20_usa_single_07.dtbo

targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*
