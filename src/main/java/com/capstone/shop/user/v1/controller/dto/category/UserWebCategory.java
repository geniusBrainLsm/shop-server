package com.capstone.shop.user.v1.controller.dto.category;

import com.capstone.shop.core.domain.entity.Category;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@AllArgsConstructor
@Builder
@Getter
public class UserWebCategory {
    private Long id;
    private String title;
    private boolean isLeaf;

    @JsonProperty("isLeaf")
    public boolean getIsLeaf() {
        return isLeaf;
    }

    public UserWebCategory(Category entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.isLeaf = entity.isLeaf();
    }

    public static List<UserWebCategory> entityListToDtoList(List<Category> categoryList) {
        return categoryList
                .stream()
                .map(UserWebCategory::new)
                .toList();
    }
}
