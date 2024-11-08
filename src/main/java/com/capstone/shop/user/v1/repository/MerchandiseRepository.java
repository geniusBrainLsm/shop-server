package com.capstone.shop.user.v1.repository;

import com.capstone.shop.entity.Merchandise;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface MerchandiseRepository extends JpaRepository<Merchandise, Long>, JpaSpecificationExecutor<Merchandise> {
    Page<Merchandise> findByNameContaining(String search, Pageable pageable);

    List<Merchandise> findTop3ByOrderByCreatedAtDesc(Specification<Merchandise> specification);

    List<Merchandise> findTop3ByOrderByViewDesc(Specification<Merchandise> specification);
}
