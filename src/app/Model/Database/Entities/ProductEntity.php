<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 27.3.19
 * Time: 22:04
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TDescriptionProperty;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TInternalNameProperty;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TTitleProperty;

/**
 * Class ProductEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class ProductEntity
{
    use TIdentificationProperties, TInternalNameProperty, TTitleProperty, TDescriptionProperty {
        TInternalNameProperty::__construct as private initializeInternalName;
        TTitleProperty::__construct as private initializeTitle;
        TDescriptionProperty::__construct as private initializeDescription;
    }

    /**
     * @var ProductTypeEntity
     * @ORM\ManyToOne(targetEntity="ProductTypeEntity")
     */
    private $type;

    /**
     * @var ProductParameterValueEntity[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="ProductParameterValueEntity", mappedBy="product", cascade={"all"}, indexBy="field_id")
     */
    private $parameterValues;

    public function __construct(string $internalName, ProductTypeEntity $type)
    {
        $this->parameterValues = new ArrayCollection();
        $this->initializeInternalName($internalName);
        $this->initializeTitle();
        $this->initializeDescription();
        $this->type = $type;
        $this->initializeFieldValues();
    }

    /**
     * @return FieldEntity[]
     */
    public function getFields(): array
    {
        return $this->getType()->getFields();
    }

    public function getFieldValue(FieldEntity $fieldEntity): ?FieldValueEntity
    {
        /** @var ProductParameterValueEntity $parameterValue */
        $parameterValue =  $this->parameterValues->get($fieldEntity->getId()->getBytes());
        if(!$parameterValue){
            return null;
        }
        return $parameterValue->getFieldValue();
    }

    private function initializeFieldValues()
    {
        $fields = $this->getFields();
        foreach ($fields as $field) {
            $parameterValue = $this->getType()->createDefaultProductValue($this, $field);
            if (!$parameterValue) {
                continue;
            }
            $this->parameterValues->set($field->getId()->getBytes(), $parameterValue);
        }

    }

    /**
     * @return ProductTypeEntity
     */
    public function getType(): ProductTypeEntity
    {
        return $this->type;
    }


}
