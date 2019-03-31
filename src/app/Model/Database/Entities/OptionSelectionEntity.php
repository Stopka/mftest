<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 17:08
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class OptionSelectionEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\FieldValues
 * @ORM\Entity()
 */
class OptionSelectionEntity
{
    use TIdentificationProperties;

    /**
     * @var SelectFieldValueEntity
     * @ORM\ManyToOne(targetEntity="SelectFieldValueEntity", inversedBy="optionSelections")
     */
    private $selectFieldValue;

    /**
     * @var SelectOptionEntity
     * @ORM\ManyToOne(targetEntity="SelectOptionEntity")
     */
    private $selectOption;

    public function __construct(SelectFieldValueEntity $selectFieldValue, SelectOptionEntity $selectOption)
    {
        $this->selectFieldValue = $selectFieldValue;
        $this->selectOption = $selectOption;
    }

    /**
     * @return SelectFieldValueEntity
     */
    public function getSelectFieldValue(): SelectFieldValueEntity
    {
        return $this->selectFieldValue;
    }

    /**
     * @return SelectOptionEntity
     */
    public function getSelectOption(): SelectOptionEntity
    {
        return $this->selectOption;
    }
}
