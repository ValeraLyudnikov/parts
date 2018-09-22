package com.test.parts.dao;

import com.test.parts.model.Parts;

import java.util.List;

public interface PartsDao {
    void save(Parts parts);
    List<Parts> getAllFromParts();
    List<Parts> getAllFromPartsLimited(int pageNumber);
    List<Parts> getPartsByFilter(String filter);
    List<Parts> getSearchingParts(String text);
    int countAllParts();
    Parts getPartById(Integer partId);
    void updatePart(Parts part);
    void deletePart(Integer partId);
    int countPossibleComputers(List<Parts> parts);
}
